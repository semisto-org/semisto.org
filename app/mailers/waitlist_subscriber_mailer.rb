class WaitlistSubscriberMailer < ApplicationMailer
  def new_subscription(waitlist_subscriber)
    @waitlist_subscriber = waitlist_subscriber
    mail(
      to: waitlist_subscriber.email,
      from: "Michael Hulet, Semisto <michael@semisto.org>",
      subject: "Merci pour votre intérêt pour les formations Semisto"
    )
  end
end
