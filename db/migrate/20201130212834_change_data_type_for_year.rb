class ChangeDataTypeForYear < ActiveRecord::Migration[6.0]
  def change
    change_column(:books, :year, :string)
    add_column(:books, :subtitle, :string)
  end
end
