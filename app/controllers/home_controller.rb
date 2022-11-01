class HomeController < ApplicationController
  def index
    waitlist = Waitlist.find_or_create_by(slug: "trainings-2023")
    @waitlist_subscriber = WaitlistSubscriber.new(waitlist: waitlist)
  end

  def terms
  end

  def privacy
  end
end
