class UsersController < ApplicationController


  def index
    @current_subscribers = current_subscribers(User.all).sort! {|a,b| a.name.downcase <=> b.name.downcase}
  end

  def lifetime
    users = User.all
    @users = users
  end


  private

  def current_subscribers(users)
    current_subscribers = []
    users.each do |user|
      unless user.subscription_events.empty?
        if user.subscription_events.last.event_type != "unsubscribed"
          current_subscribers << user
        end
      end
    end
    current_subscribers
  end



end
