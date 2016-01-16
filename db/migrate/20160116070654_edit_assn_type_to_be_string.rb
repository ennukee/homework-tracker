class EditAssnTypeToBeString < ActiveRecord::Migration
  def change
  	change_column :assignments, :assn_type, :string
  end
end
