class RenameUserIntoTournaments < ActiveRecord::Migration[5.2]
  def change
    rename_column :tournaments, :user_id, :supervisor_id
  end
end
