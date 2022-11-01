class NotifyWaitlistSubscriberJob < ApplicationJob
  queue_as :default

  def perform(waitlist_subscriber_id)
    waitlist_subscriber = WaitlistSubscriber.find_by(id: waitlist_subscriber_id)
    return unless waitlist_subscriber.present?

    WaitlistSubscriberMailer.new_subscription(waitlist_subscriber).deliver_now
  end
end
