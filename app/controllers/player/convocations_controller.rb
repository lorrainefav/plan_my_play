class Player::ConvocationsController < ApplicationController

  before_action :set_convocation, only: [:accept, :refuse]

  def index
    @user = current_user
    @convocations = @user.convocations
  end

  def accept
    @convocation.accepted!
  end

  def refuse
    @convocation.refused!
  end

  private

  def set_convocation
    @convocation = Convocation.find(params[:id])
  end
end
