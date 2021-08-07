class CreateWorkCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :work_categories do |t|
      t.references :work, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
