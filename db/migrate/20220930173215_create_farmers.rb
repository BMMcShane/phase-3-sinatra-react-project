class CreateFarmers < ActiveRecord::Migration[6.1]
  def change
    create_table :farmers do |t|
      t.string :username
      t.string :password
      t.integer :coins, default: 100
      t.string :unlocked_plants
      t.string :locked_plants
      t.boolean :logged_in
    end
  end
end
