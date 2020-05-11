class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :company, null: false, foreign_key: true
      t.string :cep
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :complement

      t.timestamps
    end
  end
end
