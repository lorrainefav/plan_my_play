class Player::AvailabilitiesController < ApplicationController
  def index
    @user = current_user
    @convocations = @user.convocations
  end
end
