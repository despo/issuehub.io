module Kobol::Requests
  class Base

    def initialize params=nil
      params = { client_id: ENV['GITHUB_KEY'], client_secret: ENV['GITHUB_SECRET'] } if params.nil?
      @client = Octokit::Client.new params
    end

    def client
      @client
    end

    def debug
      stack = Faraday::Builder.new do |builder|
        builder.response :logger
        builder.use Octokit::Response::RaiseError
        builder.adapter Faraday.default_adapter
      end
      Octokit.middleware = stack
    end

    private

    def set_response response
      @response = response
    end

    def response
      @response
    end
  end
end
