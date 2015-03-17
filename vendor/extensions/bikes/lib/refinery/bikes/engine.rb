module Refinery
  module Bikes
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Bikes

      engine_name :refinery_bikes

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "bikes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.bikes_admin_bikes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/bikes/bike',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Bikes)
      end
    end
  end
end
