class CreateKeyDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :key_donors do |t|
      t.string :relationship
      t.references :students, foreign_key: true
      t.references :donor, foreign_key: true
      t.references :donation, foreign_key: true

      t.timestamps
    end
  end
end
