class ConvocationsController < ApplicationController
  before_action :set_convocation, only: [:accept, :refuse, :send]

  def accept
    @convocation.accepted!
  end

  def refuse
    @convocation.refused!
  end

  def unique_send
    @convocation.pending!
  end

  def grouped_send
    @tournament = Tournament.find(params[:id])
    @tournament.send_convocations
    flash[:notice] = "Convocations envoyées !"
    redirect_to tournament_path(@tournament, date: params[:date])
  end

private

  def set_convocation
    @convocation = Convocation.find(params[:id])
  end

end
