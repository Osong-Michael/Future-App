class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :model
      t.string :image
      t.date :year
      t.boolean :bought, :default => false
      
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
