module Kobol::Helpers
  module Requests
    LABELS = {  'help wanted' => '128014',
                documentation: '996588' ,
                bug: 'e70b41',
                trivial: '136480',
                feature: '35563a',
                enhancement: '537699',
                design: '1f5466' ,
                refactoring: '686180' ,
                tests: 'b34f2e' ,
                translation: '208050' ,
                beginner: '66410a' ,
                html: 'd918a9' ,
                question: 'cc317c',
                accessibility: '30803c',
                'easy pick' => 'b3560b' }

    def github(message=nil, not_found_message=nil)
      yield
      @message = message
    rescue Octokit::NotFound => e
      @message = not_found_message
    rescue Octokit::UnprocessableEntity => e
      @message =  "Only the first 1000 results are available :("
    rescue Octokit::TooManyRequests => e
      @message =  "Login with your github to use your requests rate limit."
    rescue Exception => e
      @message = e.message
    end
  end
end
