class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
      t.index :name, unique: true
    end
  end
end
