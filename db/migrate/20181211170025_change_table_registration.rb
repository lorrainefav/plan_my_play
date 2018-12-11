class ChangeTableRegistration < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :ranking, :string
    add_column :registrations, :phone_number, :string
    add_column :registrations, :gender, :string
    add_column :registrations, :club, :string
  end
end
