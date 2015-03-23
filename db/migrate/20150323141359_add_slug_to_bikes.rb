class AddSlugToBikes < ActiveRecord::Migration
  def change
    add_column :refinery_bikes, :slug, :string
    add_index :refinery_bikes, :slug
  end
end
