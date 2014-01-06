module Kobol
  module Helpers
    module Authentication

      def current_user
        !session[:uid].nil?
      end

      def login_params
        current_user ? { login: session[:nickname], access_token: session[:token] } : nil
      end

      def nickname
        @nickname ||= session[:nickname] if current_user
      end
    end
  end
end
