class AddCourtToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :court, :integer
  end
end
