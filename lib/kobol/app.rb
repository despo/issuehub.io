require 'octokit'
require 'omniauth'
require 'omniauth-github'
require 'rdiscount'
require 'sinatra/base'

module Kobol
  class App < Sinatra::Base

    set :public_folder, APP_ROOT + '/public'
    set :views, APP_ROOT + "/views"

    get '/' do
      @issues = Kobol::Requests::Issues.new.search(parameters(params))

      erb :issues
    end

    protected
    def parameters hash={}, properties
      properties.each_pair do |key, values|
        hash[key] = []
        values.split(",").each { |value| hash[key] << value }
      end
      hash
    end

  end
end
