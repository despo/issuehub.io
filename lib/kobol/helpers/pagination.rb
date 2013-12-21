module Kobol
  module Helpers
    module Pagination
      def page
        page = params[:page].to_i
        page == 0 ? 1 : page
      end

      def path
        @path ||= "?label=#{params[:labels]}&language=#{params[:language]}&repo=#{params[:repo]}"
      end

      def next_page
        total_pages > page ? "#{path}&page=#{page+1}" : nil
      end

      def previous_page
        page > 1 ? "#{path}&page=#{page-1}" : nil
      end

      def total_pages
        @total_pages ||= @total/100 > 0 ? @total/100 : 1
      end
    end
  end
end
