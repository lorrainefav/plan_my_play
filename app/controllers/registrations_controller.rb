class RegistrationsController < ApplicationController
  before_action :destroy, only: [:update, :destroy]

  def index
    # byebug
    @tournament = Tournament.find(params[:id])
    @match = Match.new
      @users = @tournament.users

    if params[:search].present?
      sql_query = "category: params[:search][:category] \
      AND gender: params[:search][:gender] \
      AND ranking: params[:search][:registration_ranking]"
      @registrations = @tournament.registrations.joins(:users).where(sql_query, search: params[:search])
    else
      @registrations = @tournament.registrations
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

  def filter

  end

  private

  def set_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit([:user, :category])
  end
end
