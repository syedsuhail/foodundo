class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :phone
      t.integer :costfortwo

      t.timestamps
    end
  end
end
