class TournamentsController < ApplicationController

  def index
    @user = current_user
    @tournaments = @user.tournaments
  end

end
