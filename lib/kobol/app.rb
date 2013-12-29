require_relative 'helpers/pagination'
require_relative 'helpers/authentication'

require 'octokit'
require 'omniauth'
require 'omniauth-github'
require 'rdiscount'
require 'sinatra/base'

module Kobol
  class App < Sinatra::Base
    use Rack::Session::Cookie, :key => 'rack.session',
                               :domain => ENV['KOBOL_DOMAIN'],
                               :path => '/',
                               :expire_after => 2592000,
                               :secret => ENV['KOBOL_SECRET']

    use OmniAuth::Builder do
      provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    end

    helpers Kobol::Helpers::Pagination
    helpers Kobol::Helpers::Authentication

    enable :sessions
    set :session_secret, ENV["KOBOL_SECRET"]

    set :public_folder, APP_ROOT + '/public'
    set :views, APP_ROOT + "/views"

    get '/' do
      @nickname = session[:nickname] if current_user
      retrieve_issues(page)

      erb :issues
    end

    get '/label-guide' do
      erb :label_guide
    end

    %w(get post).each do |method|
      send(method, "/auth/:provider/callback") do
        session[:token] = env['omniauth.auth']['credentials']['token']
        session[:uid] = env['omniauth.auth']['uid']
        session[:nickname] = env['omniauth.auth']['info']['nickname']
        redirect "/"
      end
    end

    get '/auth/failure' do
      redirect '/'
    end

    get '/logout' do
      session.clear
      redirect "/"
    end

    def retrieve_issues page=1
      issues_request.search(parameters(params), page)

      @total = issues_request.total
      @issues = issues_request.issues
    rescue Octokit::TooManyRequests => e
      @issues = []
      @message =  "Login with your github to use your requests rate limit."
    rescue Exception => e
      @issues = []
      @message =  e.message
    end

    protected

    def issues_request
      login_params = current_user ? { login: session[:nickname], access_token: session[:token] } : nil
      @issues_request ||= Kobol::Requests::Issues.new(login_params)
    end

    def parameters(hash={}, properties)
      Kobol::Requests::Issues::PERMITTED.each do |key|
        hash[key] = []
        properties[key.to_s].split(",").each {|value| hash[key] << value } rescue ""
      end
      hash
    end
  end
end
