module Refinery
  module Bikes
    module Admin
      class ColorsController < ::Refinery::AdminController

        crudify :'refinery/bikes/color',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
