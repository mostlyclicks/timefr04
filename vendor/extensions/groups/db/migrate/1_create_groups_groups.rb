class CreateGroupsGroups < ActiveRecord::Migration

  def up
    create_table :refinery_groups do |t|
      t.string :name
      t.string :shift_levers
      t.string :brakes
      t.string :front_derailleur
      t.string :rear_derailleur
      t.string :crankset
      t.string :cassette
      t.string :chain
      t.integer :position

      t.timestamps
    end

    Refinery::Groups::Group.create_translation_table! :name => :string, :shift_levers => :string, :brakes => :string, :front_derailleur => :string, :rear_derailleur => :string, :crankset => :string, :cassette => :string, :chain => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-groups"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/groups/groups"})
    end

    drop_table :refinery_groups

    Refinery::Groups::Group.drop_translation_table!

  end

end
