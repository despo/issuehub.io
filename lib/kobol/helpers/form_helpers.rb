module Kobol
  module Helpers
    module FormHelpers

      def is_selected?(label)
        "checked" if params["label"].include?(label)
      rescue
        ""
      end

    end
  end
end
