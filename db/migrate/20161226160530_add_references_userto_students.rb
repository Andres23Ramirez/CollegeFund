class AddReferencesUsertoStudents < ActiveRecord::Migration[5.0]
  def change
  	add_reference :students, :user, index: true
  end
end
