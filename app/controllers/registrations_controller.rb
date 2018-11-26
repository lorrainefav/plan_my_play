class RegistrationsController < ApplicationController
  before_action :destroy, only: [:update, :destroy]

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
