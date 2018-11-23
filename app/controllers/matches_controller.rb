class MatchesController < ApplicationController
  before_action :set_match, only: [:update, :destroy]
  def index

  end

  def create
    @match = Match.new(match_params)
    @convocation = Convocation.new(convocation_params)

  end

  def update
    # byebug
    @match.save(match_params)
    redirect_to tournament_path(@match.tournament)
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
    params.require(:match).permit(:begin_at)
  end

  def convocation_params
    params.require(:convocation).permit(:user)

  end

end
