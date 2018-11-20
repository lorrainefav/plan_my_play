class ChangeDurationToTournaments < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tournaments, :match_duration, 90
  end
end
