class CreatePaymentMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_methods do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
