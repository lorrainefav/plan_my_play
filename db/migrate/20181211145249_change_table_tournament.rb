class ChangeTableTournament < ActiveRecord::Migration[5.2]
  def change
    change_table :tournaments do |t|
      t.rename :photo_url, :photo
    end
  end
end
