class UsersController < ApplicationController

  def index
   @tournament = Tournament.find(params[:tournament_id])
   @users = @tournament.users.all
  end

end
