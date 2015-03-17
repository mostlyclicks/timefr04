# This migration comes from refinery_bikes (originally 2)
class CreateBikesColors < ActiveRecord::Migration

  def up
    create_table :refinery_bikes_colors do |t|
      t.string :name
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    Refinery::Bikes::Color.create_translation_table! :name => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bikes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bikes/colors"})
    end

    drop_table :refinery_bikes_colors

    Refinery::Bikes::Color.drop_translation_table!

  end

end
