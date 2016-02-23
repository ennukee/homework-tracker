class CreateSiteTexts < ActiveRecord::Migration
  def change
    create_table :site_texts do |t|
      t.string :title
      t.text :content
      t.boolean :important
      t.boolean :markdown

      t.timestamps null: false
    end
  end
end
