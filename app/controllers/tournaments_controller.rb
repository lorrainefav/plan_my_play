class TournamentsController < ApplicationController


  def show
   @tournament = Tournament.find(params[:id])
  end

  def index
    @user = current_user
    @tournaments = @user.tournaments
  end

end
