class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :producer
      t.string :description
      t.string :text
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps null: false
    end
  end
end
