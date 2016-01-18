class AddImportantDefaultForAssignments < ActiveRecord::Migration
  def change
  	change_column :assignments, :important, :boolean, :default => false
  end
end
