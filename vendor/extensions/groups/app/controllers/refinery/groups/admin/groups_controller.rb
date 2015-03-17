module Refinery
  module Groups
    module Admin
      class GroupsController < ::Refinery::AdminController

        crudify :'refinery/groups/group',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
