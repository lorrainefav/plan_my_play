class ChangeTableUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :club
      t.remove :gender
      t.remove :ranking
      t.remove :phone_number
    end
  end
end
