module Refinery
  module Bikes
    class BikesController < ::ApplicationController

      before_filter :find_all_bikes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bike in the line below:
        present(@page)
      end

      def show
        @bike = Bike.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bike in the line below:
        present(@page)
      end

    protected

      def find_all_bikes
        @bikes = Bike.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bikes").first
      end

    end
  end
end
