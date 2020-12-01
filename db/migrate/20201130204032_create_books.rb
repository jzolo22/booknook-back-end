class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :year
      t.string :description
      t.string :genre
      t.string :image
      t.integer :page_length

      t.timestamps
    end
  end
end
