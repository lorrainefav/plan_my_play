class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :begin_at
      t.datetime :end_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
