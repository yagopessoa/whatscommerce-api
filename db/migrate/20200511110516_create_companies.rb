class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :logo
      t.string :instagram_url
      t.string :facebook_url
      t.string :opening_hours
      t.string :whatsapp_number
      t.string :page_url

      t.timestamps
    end
  end
end
