class TournamentsController < ApplicationController
  before_action :set_tournaments, only: [:show, :edit, :update]
  def index
    @user = current_user
    @tournaments = @user.tournaments
    @tournament = Tournament.new

  end

  def show
   @match = Match.new
   if params[:date].present?
    @date = DateTime.parse(params[:date])
  else
   @date = DateTime.now
  end
end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.supervisor = current_user
    if @tournament.save
      respond_to do |format|
        format.html { redirect_to tournaments_path }
        format.js # render create.js.erb
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
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
