class CreateFarms < ActiveRecord::Migration[6.1]
  def change
    create_table :farms do |t|
      t.integer :farmer_id
    end
  end
end
