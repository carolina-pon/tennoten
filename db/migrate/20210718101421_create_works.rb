class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :size
      t.string :weight
      t.string :material, null: false
      t.string :images, null: false
      t.timestamps
    end
  end
end
