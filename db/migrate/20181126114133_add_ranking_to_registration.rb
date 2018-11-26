class AddRankingToRegistration < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :registration_ranking, :string
  end
end
