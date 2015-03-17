module Refinery
  module Bikes
    module Admin
      class BikesController < ::Refinery::AdminController

        crudify :'refinery/bikes/bike',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
