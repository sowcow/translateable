class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.text :body
      t.string :ancestry

      t.timestamps
    end
    add_index :texts, :ancestry
  end
end
