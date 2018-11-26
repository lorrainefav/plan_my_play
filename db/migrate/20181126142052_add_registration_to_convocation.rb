class AddRegistrationToConvocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :convocations, :registration, foreign_key: true
    remove_reference :convocations, :user, foreign_key: true
  end
end
