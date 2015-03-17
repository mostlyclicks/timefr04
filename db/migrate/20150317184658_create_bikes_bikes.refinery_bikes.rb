# This migration comes from refinery_bikes (originally 1)
class CreateBikesBikes < ActiveRecord::Migration

  def up
    create_table :refinery_bikes do |t|
      t.string :name
      t.integer :hero_logo_id
      t.integer :hero_image_id
      t.integer :hero_background_id
      t.text :hero_description
      t.text :fork_standard
      t.integer :fork_standard_image_id
      t.text :fork_aktiv
      t.integer :fork_aktiv_image_id
      t.integer :position

      t.timestamps
    end

    Refinery::Bikes::Bike.create_translation_table! :name => :string, :hero_description => :text, :fork_standard => :text, :fork_aktiv => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bikes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bikes/bikes"})
    end

    drop_table :refinery_bikes

    Refinery::Bikes::Bike.drop_translation_table!

  end

end
