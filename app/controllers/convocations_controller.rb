class ConvocationsController < ApplicationController
  before_action :set_convocation, only: [:accept, :refuse, :send]

  def accept
    @convocation.accepted!
  end

  def refuse
    @convocation.refused!
  end

  def send
    @convocation.sent!
  end

  def grouped_send

  end

private

  def set_convocation
    @convocation = Convocation.find(params[:id])
  end

end
