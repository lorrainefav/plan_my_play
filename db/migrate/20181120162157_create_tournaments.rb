class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :city
      t.integer :courts_number
      t.datetime :begin_at
      t.datetime :end_at
      t.references :user, foreign_key: true
      t.integer :match_duration

      t.timestamps
    end
  end
end
