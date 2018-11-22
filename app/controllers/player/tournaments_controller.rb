class Player::TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end
end
