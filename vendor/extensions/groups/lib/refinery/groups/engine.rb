module Refinery
  module Groups
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Groups

      engine_name :refinery_groups

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "groups"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.groups_admin_groups_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/groups/group',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Groups)
      end
    end
  end
end
