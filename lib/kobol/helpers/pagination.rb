module Kobol
  module Helpers
    module Pagination
      def page
        page = params[:page].to_i
        page == 0 ? 1 : page
      end

      def path
        @path ||= request.fullpath
      end

      def next_page
        return unless total_pages > page

        @next_path ||= path + "&page=#{page+1}" unless path.include?("page=")
        @next_path ||= path.sub(%Q{&page=#{page}}, %Q{&page=#{page+1}})
      end

      def previous_page
        return unless page > 1

        @prev_path ||= path + "&page=#{page-1}" unless path.include?("page=")
        @prev_path ||= path.sub(%Q{&page=#{page}}, %Q{&page=#{page-1}})
      end

      def total_pages
        @total_pages ||= @total/100 > 0 ? @total/100 : 1
      end
    end
  end
end
