class PlansController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create, :destroy]
  respond_to :json

  def index
    respond_to do |format|
      format.json {render :json => Plan.all, :include => {:features => {:only => [:id, :name, :limit]}}, :except => [:created_at, :updated_at]}
      format.html
    end
  end

  def create
    respond_with Plan.create(plan_params)
  end

  def destroy
    respond_with Plan.destroy(params[:id])
  end

  private
  def plan_params
    params.require(:plan).permit(:name, :description, :price, features_attributes: [:id, :name, :limit])
  end
end
