class WaitlistSubscriberMailer < ApplicationMailer
  def new_subscription(waitlist_subscriber)
    @waitlist_subscriber = waitlist_subscriber
    mail(
      to: waitlist_subscriber.email,
      from: email_address_with_name("michael@semisto.org", "Michael Hulet, Semisto"),
      subject: "Merci pour votre intérêt pour les formations Semisto"
    )
  end
end
