class AddAssignmentTypesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :assignment_types, :string, array: true, default: ["Extra Credit","Homework","Major Homework","Project","Exam"]
  end
end
