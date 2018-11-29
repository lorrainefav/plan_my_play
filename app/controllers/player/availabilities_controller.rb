class Player::AvailabilitiesController < ApplicationController
before_action :set_availability, only: [:update, :destroy]

  def index
    @user = current_user
    @availabilities = @user.availabilities
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(params_availability)
    @availability.end_at = @availability.end_at.change(day: @availability.begin_at.day, month: @availability.begin_at.month, year: @availability.begin_at.year)

    @availability.user = current_user
    if @availability.save
      redirect_to player_availabilities_path
    else
      render :index
    end
  end

  def update
    @availability.update(params_availability)
    redirect_to player_availabilities_path
  end

  def destroy
    @availability.destroy
    redirect_to player_availabilities_path
  end

  private

  def set_availability
    @availability = Availability.find(params[:id])
  end

  def params_availability
    params.require(:availability).permit(:begin_at, :end_at, :user_id)
  end
end
