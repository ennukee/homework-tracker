class AddImportantToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :important, :boolean
  end
end
