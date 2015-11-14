class PlansController < ApplicationController
  respond_to :json

  def index
    respond_to do |format|
      format.json { render json: Plan.all }
      format.html
    end
  end
end
