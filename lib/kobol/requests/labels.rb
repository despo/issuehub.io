module Kobol::Requests
  class Labels < Kobol::Requests::Base
    def initialize login, repository
      @repository = repository

      super(login)
    end

    def create(label, color)
      client.add_label(@repository, label, color)
    end

    def create_or_update_labels(labels)
      labels.each do |key, value|
        begin
          create(key, value)
        rescue Exception => e
          update(key, "color" => value)
        end
      end
    end

    def update(label, options={})
      client.update_label(@repository, label.to_s, options)
    end
  end
end
