class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
