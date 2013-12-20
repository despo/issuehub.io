module Kobol
  class Label

    attr_reader :name

    def initialize attributes
      attributes.each { |property,value| instance_variable_set("@#{property}", value) }
    end

    def color
      @label_color ||= [ "ffffff", "ededed" ].include?(@color.downcase) ? "#999" : "##{@color}"
    end

  end
end
