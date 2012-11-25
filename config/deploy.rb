set :application, "testapp"
set :repository,  "git@github.com:alejomongua/testapp.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :deploy_to, "/home/alejomongua/webapps/testapp"

role :web, "web312.webfaction.com"                          # Your HTTP server, Apache/etc
role :app, "web312.webfaction.com"                          # This may be the same as your `Web` server
role :db,  "web312.webfaction.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
set :user, "alejomongua"
set :scm_parafrase, "Resistencia86"
set :use_sudo, false
default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end
end
