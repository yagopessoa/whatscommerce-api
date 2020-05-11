class CreateOptionals < ActiveRecord::Migration[6.0]
  def change
    create_table :optionals do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :min
      t.integer :max
      t.string :name
      t.text :options, array: true, default: []

      t.timestamps
    end
  end
end
