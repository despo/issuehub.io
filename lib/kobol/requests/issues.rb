module Kobol::Requests
  class Issues < Kobol::Requests::Base

    def search properties
      issues = @client.search_issues("#{search_params(properties)} state:open")[:items]

      parse(issues)
    rescue Exception => e
      parse([])
    end

    private
    def parse(issues)
      issues.map { |issue| parse_issue(issue) }
    end

    def parse_issue issue
      Kobol::Issue.new(title: issue.title, labels: issue.labels,
                       body: issue.body, comments: issue.comments,
                       url: issue._rels[:html].href)
    end

    def search_params search_params
      search_params.map { |key,values| values.map { |value| "#{key}:#{value.strip}" } }.join(" ")
    end

  end
end
