class AddBirthdateToStudents < ActiveRecord::Migration
  def change
    add_column :students, :birthdate, :datetime
  end
end
