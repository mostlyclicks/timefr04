module Refinery
  module Bikes
    module Admin
      class FeaturesController < ::Refinery::AdminController

        crudify :'refinery/bikes/feature',
                :xhr_paging => true

      end
    end
  end
end
