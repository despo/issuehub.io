module Kobol::Requests
  class Issues < Kobol::Requests::Base
    PERMITTED = [ :language, :label, :repo ]

    def search(properties, page)
      set_response(client.search_issues("#{search_params(properties)} state:open", sort: "updated", page: page))
    end

    def total
      @total ||= response[:total_count]
    end

    def issues
      @issues ||= response[:items].map {|issue| parse_issue(issue) }
    end

    private

    def set_response response
      @response = response
    end

    def response
      @response
    end

    def parse_issue issue
      Kobol::Presenters::Issue.new(title: issue.title,
                                   labels: issue.labels,
                                   body: issue.body,
                                   comments: issue.comments,
                                   updated_at: issue.updated_at,
                                   url: issue._rels[:html].href)
    end

    def search_params(search_params)
      response = search_params.map {|key,values| values.map {|value| "#{key}:#{value.strip}" }}.join(" ").strip
      raise Exception, "You must choose a label, language or repo to get started." if response.empty?
      response
    end
  end
end
