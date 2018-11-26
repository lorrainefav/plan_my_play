class Player::AvailabilitiesController < ApplicationController

  def index
    @user = current_user
  end

end
