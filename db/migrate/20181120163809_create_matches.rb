class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :tournament, foreign_key: true
      t.datetime :begin_at

      t.timestamps
    end
  end
end
