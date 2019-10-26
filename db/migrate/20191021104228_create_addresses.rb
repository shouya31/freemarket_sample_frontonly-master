class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer     :postal_code,      null: false
      t.string      :prefectures,      null: false
      t.string      :city,             null: false
      t.string      :address,          null: false
      t.string      :building,         null: true
      t.string      :phonenumber,      null: true, unique: true
      t.string      :first_name,       null: true
      t.string      :last_name,        null: true
      t.string      :kana_first_name,  null: true
      t.string      :kana_last_name,   null: true
      t.timestamps
    end
  end
end
