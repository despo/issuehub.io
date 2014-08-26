module Kobol::Helpers
  module Requests
    LABELS = {  'help wanted' => '159818',
                documentation: 'e395c9' ,
                bug: 'e70b41',
                trivial: '25bdf1',
                feature: '3c9d4a',
                enhancement: '71a1d0',
                design: 'fbca04' ,
                refactoring: 'a095c4' ,
                tests: 'd66038' ,
                translation: '34d081' ,
                beginner: 'b89055' ,
                html: 'f11abc' ,
                question: 'cc317c'}

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
