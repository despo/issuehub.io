require_relative 'helpers/pagination'

require 'octokit'
require 'omniauth'
require 'omniauth-github'
require 'rdiscount'
require 'sinatra/base'

module Kobol
  class App < Sinatra::Base

    helpers Kobol::Helpers::Pagination

    set :public_folder, APP_ROOT + '/public'
    set :views, APP_ROOT + "/views"

    get '/' do
      retrieve_issues(page)

      erb :issues
    end

    def retrieve_issues page=1
      issues_request.search(parameters(params), page)

      @total = issues_request.total
      @issues = issues_request.issues
    end

    protected

    def issues_request
      @issues_request ||= Kobol::Requests::Issues.new
    end

    def parameters(hash={}, properties)
      Kobol::Requests::Issues::PERMITTED.each do |key|
        hash[key] = []
        properties[key.to_s].split(",").each {|value| hash[key] << value }
      end
      hash
    end

  end
end
