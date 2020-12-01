class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.boolean :recommend
      t.integer :rating

      t.timestamps
    end
  end
end
