class AddDatasToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :supervisor, :boolean
    add_column :users, :last_name, :string
    add_column :users,  :first_name, :string
    add_column :users,  :club, :string
    add_column :users,  :licence, :string
    add_column :users,  :gender, :string
    add_column :users,  :ranking, :string
    add_column :users,  :phone_number, :string
  end
end
