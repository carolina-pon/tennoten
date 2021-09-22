class CreateAuthorWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :author_works do |t|
      t.references :work, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true
      t.timestamps
    end
  end
end
