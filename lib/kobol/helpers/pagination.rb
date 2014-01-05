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
        if total_pages > page
          next_path = path.gsub(%Q{&page=#{page}}, %Q{&page=#{page+1}})
          next_path ||= path + "&page=#{page+1}"
        end
      end

      def previous_page
        if page > 1
          next_path = path.gsub(%Q{&page=#{page}}, %Q{&page=#{page-1}})
          next_path ||= path + "&page=#{page-1}"
        end
      end

      def total_pages
        @total_pages ||= @total/100 > 0 ? @total/100 : 1
      end
    end
  end
end
