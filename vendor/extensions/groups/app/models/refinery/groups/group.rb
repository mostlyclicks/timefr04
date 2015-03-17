module Refinery
  module Groups
    class Group < Refinery::Core::BaseModel
      self.table_name = 'refinery_groups'

      attr_accessible :name, :shift_levers, :brakes, :front_derailleur, :rear_derailleur, :crankset, :cassette, :chain, :position

      translates :name, :shift_levers, :brakes, :front_derailleur, :rear_derailleur, :crankset, :cassette, :chain

      class Translation
        attr_accessible :locale
      end

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
