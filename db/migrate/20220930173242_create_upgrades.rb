class CreateUpgrades < ActiveRecord::Migration[6.1]
  def change
    create_table :upgrades do |t|
      t.integer :farmer_id
      t.integer :farm_id
      t.integer :farm_upgrade_level
      t.integer :farmer_upgrade_level
    end
  end
end
