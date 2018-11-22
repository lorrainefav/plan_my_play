class TournamentsController < ApplicationController

  def index
    @user = current_user
    @tournaments = @user.tournaments
  end

  def show
   @tournament = Tournament.find(params[:id])
  end


end
