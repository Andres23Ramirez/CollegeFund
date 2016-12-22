class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.date :birthdate
      t.string :username
      t.integer :goal
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
