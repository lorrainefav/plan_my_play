class UsersController < ApplicationController
<<<<<<< HEAD

  def index
   @tournament = Tournament.find(params[:tournament_id])
   @users = @tournament.users.all
=======
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @users = @tournament.users.all
>>>>>>> 699bb89050303b18d3c9cc39552ac1445ebbbda9
  end
end
