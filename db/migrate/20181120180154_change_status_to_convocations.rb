class ChangeStatusToConvocations < ActiveRecord::Migration[5.2]
  def change
    change_column_default :convocations, :status, 0
  end
end
