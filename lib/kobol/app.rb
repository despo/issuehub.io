require 'octokit'
require 'omniauth'
require 'omniauth-github'
require 'rdiscount'
require 'sinatra/base'

module Kobol
  class App < Sinatra::Base
    helpers Kobol::Helpers::Authentication
    helpers Kobol::Helpers::Pagination
    helpers Kobol::Helpers::Requests
    helpers Kobol::Helpers::FormHelpers

    use Rack::Session::Cookie, :key => 'rack.session',
                               :domain => ENV['KOBOL_DOMAIN'],
                               :path => '/',
                               :expire_after => 2592000,
                               :secret => ENV['KOBOL_SECRET']

    use OmniAuth::Builder do
      provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    end

    enable :sessions

    set :session_secret, ENV["KOBOL_SECRET"]
    set :public_folder, APP_ROOT + '/public'
    set :views, APP_ROOT + "/views"

    get '/' do
      retrieve_issues(page)

      erb :issues
    end

    get '/label-guide' do
      erb :label_guide
    end

    get '/privacy-policy' do
      erb :privacy_policy
    end

    post '/labels' do
      repository = params[:project]
      create_or_update_labels(repository)

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

    def retrieve_issues(page=1)
      @issues = []
      github { issues_request.search(parameters(params), page) }

      @total = issues_request.total rescue nil
      @issues = issues_request.issues rescue []
    end

    protected

    def issues_request
      @issues_request ||= Kobol::Requests::Issues.new(login_params)
    end

    def create_or_update_labels(repository)
      message = "Labels have been created for <a href='http://github.com/#{repository}/issues'>#{repository}</a>!"

      labels = Kobol::Requests::Labels.new(login_params, repository)
      github(message, "#{repository} not found!") { labels.create_or_update_labels(LABELS) }
    end

    def parameters(hash={}, properties)
      Kobol::Requests::Issues::PERMITTED.each do |key|
        hash[key] = []
        properties[key.to_s].each do |value|
          hash[key] << value
        end rescue ""

        properties[key.to_s].split(",").each do |value|
          hash[key] << value
        end rescue ""
      end
      hash
    end
  end
end
