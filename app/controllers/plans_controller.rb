class PlansController < ApplicationController
  respond_to :json

  def index
    respond_to do |format|
      format.json {render :json => Plan.all, :include => {:features => {:only => [:id, :name, :limit]}}, :except => [:created_at, :updated_at]}
      format.html
    end
  end
end
