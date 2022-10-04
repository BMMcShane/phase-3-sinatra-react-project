class CreateFarmers < ActiveRecord::Migration[6.1]
  def change
    create_table :farmers do |t|
      t.integer :coins
      t.datetime :date
      t.string :username
      t.string :password
      t.string :plants
    end
  end
end
