class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.string :site, null: false
      t.string :sns

      t.timestamps
      t.index :name, unique: true
    end
  end
end
