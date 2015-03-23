module Refinery
  module Bikes
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Bikes

      engine_name :refinery_bikes

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "colors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.bikes_admin_colors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/bikes/color',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/bikes/colors(/.*)?$}
          plugin.hide_from_menu = true
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Colors)
      end
    end
  end
end
