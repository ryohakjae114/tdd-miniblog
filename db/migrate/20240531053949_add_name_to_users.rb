class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false, default: '', limit: 20
    add_index :users, :name, unique: true
  end
end
