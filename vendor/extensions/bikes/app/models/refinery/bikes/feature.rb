module Refinery
  module Bikes
    class Feature < Refinery::Core::BaseModel

      attr_accessible :title, :description, :image_id, :position

      translates :description

      class Translation
        attr_accessible :locale
      end

      validates :title, :presence => true, :uniqueness => true

      belongs_to :bikes, :class_name => 'Refinery::Bikes::Bike'
      belongs_to :image, :class_name => 'Refinery::Image'
    end
  end
end
