module Kobol::Presenters
  class Issue

    attr_reader :title, :comments, :url

    def initialize(attributes)
      attributes.each { |property,value| instance_variable_set("@#{property}", value) }
    end

    def body
      @body ? Markdown.new(@body).to_html : nil
    end

    def repo
      @url.gsub(/^(((https|http)?:\/\/(www\.)?))github.com(:|\/)/i, '').gsub(/(\/issues(.*)|\/pull(.*))$/i, '')
    end

    def labels
      @labels.map { |label| Label.new(name: label.name, color: label.color) }
    end
  end
end
