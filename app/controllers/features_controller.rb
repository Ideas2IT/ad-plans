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
    features = params.except(:action, :controller, :planId, :format, :feature)
    features.each do |key,value|
      plan.features.create(name: key, limit: value)
    end
    respond_to do |format|
      format.json {render :json => {features: plan.features}, :except => [:created_at, :updated_at]}
      format.html
    end
  end

  def update
    plan = Plan.find(params[:planId])
    features = params.except(:action, :controller, :planId, :format, :feature)
    plan_features = [];
    plan.features.each do |value|
      feature = Feature.find(value.id)
      feature.update_attributes(name: feature.name, limit: features[feature.name], plan_id: plan.id)
      plan_features.push(feature)
    end
    plan.features = plan_features
    respond_to do |format|
      Rails.logger.info(plan.features);
      format.json {render :json => {features: plan.features}, :except => [:created_at, :updated_at]}
      format.html
    end
  end

  def destroy
    respond_with Feature.destroy(params[:id])
  end

  private
  def feature_params
    params.require(:feature).permit(:name, :limit,  :plan_id)
  end
end
