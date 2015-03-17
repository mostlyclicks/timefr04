class CreateBikesFeatures < ActiveRecord::Migration

  def up
    create_table :refinery_bikes_features do |t|
      t.string :title
      t.text :description
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    Refinery::Bikes::Feature.create_translation_table! :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bikes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bikes/features"})
    end

    drop_table :refinery_bikes_features

    Refinery::Bikes::Feature.drop_translation_table!

  end

end
