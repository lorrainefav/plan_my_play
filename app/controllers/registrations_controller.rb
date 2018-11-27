class RegistrationsController < ApplicationController
  before_action :destroy, only: [:update, :destroy]

  def index
    @tournament = Tournament.find(params[:id])
    @match = Match.new
    @registrations = @tournament.registrations

    if params[:search].present?
      query = params[:search][:query].nil? ? "" : params[:search][:query]
      category = params[:search][:category].nil? ? "" : params[:search][:category]
      gender = params[:search][:gender].nil? ? "" : params[:search][:gender]
      registration_ranking = params[:search][:registration_ranking].nil? ? "" : params[:search][:registration_ranking]
      filters = "#{query} #{category} #{gender} #{registration_ranking}"
      @registrations = @tournament.registrations.filter_players(filters) if filters.present?
    end
  end

  def new
    @user = User.new
    @registration = Registration.new
  end

  def create
    @user = User.new(user_params)
    @registration = Registration.new(registration_params)
  end

  def update
    @registration.update(registration_params)
  end

  def destroy
    @registration.destroy
  end


  private

  def set_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit([:user, :category])
  end
end
