class Player::TournamentsController < ApplicationController
  def index
    @user = current_user

    @registrations = @user.registrations
  end
end
