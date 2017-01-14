class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.date :date
      t.integer :amount
      t.text :note

      t.timestamps
    end
  end
end
