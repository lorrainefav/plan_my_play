class TournamentsController < ApplicationController
  before_action :set_tournaments, only: [:show, :edit, :update]
  def index
    @user = current_user
    @tournaments = @user.tournaments
  end

  def show
   @match = Match.new
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.supervisor = current_user
    if @tournament.save
      redirect_to tournaments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to tournaments_path
    else
      render :edit
    end
  end

  private

  def set_tournaments
   @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit([:name, :city, :courts_number, :begin_at, :end_at, :user])
  end
end
