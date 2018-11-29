class AddPhotoToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :photo_url, :string
  end
end
