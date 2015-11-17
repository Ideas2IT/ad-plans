class FeaturesController < ApplicationController
  respond_to :json

  def index
    respond_to do |format|
      format.json {render :json => Feature.all, :except => [:created_at, :updated_at]}
      format.html
    end
  end

  def edit
    respond_with Feature.find(params[:id])
  end

  def create
    plan = Plan.find(params[:planId])
    features = params.except(:planId)
    features.each do |key,value|
      plan.features.create(name: key, limit: value)
    end
    respond_with Plan.features
  end

  def update
    feature = Feature.find(params[:id])
    respond_with feature.update_attributes(feature_params)
  end

  def destroy
    respond_with Feature.destroy(params[:id])
  end

  private
  def feature_params
    params.require(:feature).permit(:name, :limit,  :plan_id)
  end
end
