module PlansHelper
  def not_subscribed? plan
    !(current_user.plans.include? plan)
  end
end
