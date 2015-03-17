module Refinery
  module Bikes
    class ColorsController < ::ApplicationController

      before_filter :find_all_colors
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @color in the line below:
        present(@page)
      end

      def show
        @color = Color.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @color in the line below:
        present(@page)
      end

    protected

      def find_all_colors
        @colors = Color.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/colors").first
      end

    end
  end
end
