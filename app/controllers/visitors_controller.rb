class VisitorsController < ApplicationController
  def index
    @plans = Plan.all
  end
end
