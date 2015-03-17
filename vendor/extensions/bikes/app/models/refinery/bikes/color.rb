module Refinery
  module Bikes
    class Color < Refinery::Core::BaseModel

      attr_accessible :name, :image_id, :position

      translates :name

      class Translation
        attr_accessible :locale
      end

      validates :name, :presence => true, :uniqueness => true

      belongs_to :bikes, class_name: 'Refinery::Bikes::Bike'
      belongs_to :image, :class_name => 'Refinery::Image'
    end
  end
end
