class CreateDeliveryOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_options do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.decimal :tax, precision: 10, scale: 2
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
