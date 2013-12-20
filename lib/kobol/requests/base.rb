module Kobol::Requests
  class Base

    def initialize
      @client = Octokit::Client.new(:oauth_token => ENV['GITHUB_TOKEN'])
    end

    def debug
      stack = Faraday::Builder.new do |builder|
        builder.response :logger
        builder.use Octokit::Response::RaiseError
        builder.adapter Faraday.default_adapter
      end
      Octokit.middleware = stack
    end
  end
end
