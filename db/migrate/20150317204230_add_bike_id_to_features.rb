class AddBikeIdToFeatures < ActiveRecord::Migration
  def change
    add_column :refinery_bikes_features, :bike_id, :integer
  end
end
