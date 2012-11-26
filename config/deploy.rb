set :application, "testapp"
set :repository,  "ssh://git@github.com:alejomongua/testapp.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :deploy_to, "/home/alejomongua/webapps/testapp"

role :web, "web312.webfaction.com"                          # Your HTTP server, Apache/etc
role :app, "web312.webfaction.com"                          # This may be the same as your `Web` server
role :db,  "web312.webfaction.com", :primary => true # This is where Rails migrations will run
set :passphrase, "Resistencia86"
# role :db,  "your slave db-server here"
set :user, "alejomongua"
#set :scm_passphrase, "Resistencia86"
set :ssh_options, {:forward_agent => true}

set :use_sudo, false
default_run_options[:pty] = true
set :keep_releases, 5

#set :default_environment, {
#  'PATH' => "#{deploy_to}/bin:$PATH",
#  'GEM_HOME' => "#{deploy_to}/gems", 
#  'RUBYLIB' => "#{deploy_to}/lib"
#}

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do

  desc "Push local changes to Git repository"
  task :push do

    # Check for any local changes that haven't been committed
    # Use 'cap deploy:push IGNORE_DEPLOY_RB=1' to ignore changes to this file (for testing)
    status = %x(git status --porcelain).chomp
    if status != ""
      if status !~ %r{^[M ][M ] config/deploy.rb$}
        raise Capistrano::Error, "Local git repository has uncommitted changes"
      elsif !ENV["IGNORE_DEPLOY_RB"]
        # This is used for testing changes to this script without committing them first
        raise Capistrano::Error, "Local git repository has uncommitted changes (set IGNORE_DEPLOY_RB=1 to ignore changes to deploy.rb)"
      end
    end

    # Check we are on the master branch, so we can't forget to merge before deploying
    branch = %x(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \\(.*\\)/\\1/').chomp
    if branch != "master" && !ENV["IGNORE_BRANCH"]
      raise Capistrano::Error, "Not on master branch (set IGNORE_BRANCH=1 to ignore)"
    end

    # Push the changes
    if ! system "git push #{fetch(:repository)} master"
      raise Capistrano::Error, "Failed to push changes to #{fetch(:repository)}"
    end

  end

  desc "precompilar assets localmente"
  task :precompilar_assets, :except => { :no_release => true } do
    run_locally("rake assets:clean && rake assets:precompile")
  end
  
  before "deploy:update_code", "deploy:push"
  after "deploy:update_code", 'deploy:precompilar_assets'
  after "deploy:create_symlink", 'other:deploy_assets'

  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end
end

namespace :other do
  desc "deploy the precompiled assets"
  task :deploy_assets, :except => { :no_release => true } do
    upload("public/assets", "#{current_path}/public/", via: :scp, :recursive => true) 
    run("cp #{current_path}/public/assets/* /home/alejomongua/webapps/statictestapp/")
  end
end
