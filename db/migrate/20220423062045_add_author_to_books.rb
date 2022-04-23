class AddAuthorToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :auther, :string
  end
end
