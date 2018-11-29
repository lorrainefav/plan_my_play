class Player::ConvocationsController < ApplicationController

  before_action :set_convocation, only: [:accept, :refuse]

  def index
    @user = current_user
    @pending_convocations = @user.convocations.pending_ones
    @current_convocations = @user.convocations.current_ones
    respond_to do |format|
        format.html
        format.js
    end
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
