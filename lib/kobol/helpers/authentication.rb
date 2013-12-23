module Kobol
  module Helpers
    module Authentication

      def current_user
        !session[:uid].nil?
      end
    end
  end
end
