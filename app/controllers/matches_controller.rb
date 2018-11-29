class MatchesController < ApplicationController
  before_action :set_match, only: [:update, :destroy]
  def index

  end

  def create
    @tournament = Tournament.find(params[:id])
    @match = @tournament.matches.new(match_params)
    if @match.save
      redirect_to @tournament
    else
      render 'tournaments/show'
    end
  end

  def update
    @match.update(match_params)
    respond_to do |format|
      # format.html{redirect_to tournament_path(@match.tournament)}
      format.js{head :ok}
    end

  end

  def destroy
    @match.destroy
    redirect_to tournament_path(@match.tournament)
  end

  private


  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:begin_at, :court, convocations_attributes: [:registration_id])
  end

  # def convocation_params
  #   params.require(:convocation).permit(:user)

  # end

end
