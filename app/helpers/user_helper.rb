module UserHelper

    def lifetime_value(user)
      value = 0
      i = 0
      unless user.subscription_events.empty?
        while i < user.subscription_events.length
          if i == (user.subscription_events.length - 1)
            value += (Date.today.beginning_of_month - user.subscription_events[i].date).to_i  * (user.subscription_events[i].price_per_month_in_cents/30)
          else
            value += (user.subscription_events[i+1].date - user.subscription_events[i].date).to_i * (user.subscription_events[i].price_per_month_in_cents/30)
          end
          i += 1
        end
      end
      value
    end

end
