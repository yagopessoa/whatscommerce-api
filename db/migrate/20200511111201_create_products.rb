class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :image
      t.integer :min_quantity, default: 1
      t.integer :max_quantity
      t.decimal :price, precision: 10, scale: 2
      t.string :production_time
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
