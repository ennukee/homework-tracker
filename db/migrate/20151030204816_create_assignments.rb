class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_date
      t.integer :percent_done
      t.integer :assn_type
      t.integer :priority

      t.timestamps null: false
    end
  end
end
