module Refinery
  module Bikes
    class Bike < Refinery::Core::BaseModel
      self.table_name = 'refinery_bikes'

      attr_accessible :name, :hero_logo_id, :hero_image_id, :hero_background_id, :hero_description, :fork_standard, :fork_standard_image_id, :fork_aktiv, :fork_aktiv_image_id, :position

      translates :name, :hero_description, :fork_standard, :fork_aktiv

      class Translation
        attr_accessible :locale
      end

      validates :name, :presence => true, :uniqueness => true

      belongs_to :hero_logo, :class_name => '::Refinery::Image'

      belongs_to :hero_image, :class_name => '::Refinery::Image'

      belongs_to :hero_background, :class_name => '::Refinery::Image'

      belongs_to :fork_standard_image, :class_name => '::Refinery::Image'

      belongs_to :fork_aktiv_image, :class_name => '::Refinery::Image'
    end
  end
end
