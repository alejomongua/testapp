require 'json'

class SesionesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def fb_callback
    if params.has_key?(:code)
      session[:code] = params[:code]
      auth_url = "https://graph.facebook.com/oauth/access_token?client_id=#{Testapp::Application::APP_ID}&redirect_uri=#{root_path}&client_secret=#{Testapp::Application::APP_SECRET}&code=#{params[:code]}"
      session[:user] = JSON.parse(open(auth_url).read)
    else
      redirect_to 'https://www.facebook.com/dialog/oauth?client_id=121617807996302&redirect_uri=http%3A%2F%2Falejomongua.webfactional.com%2Ffacebook_callback&scope=email'      
    end
  end
end
