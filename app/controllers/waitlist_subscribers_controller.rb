class WaitlistSubscribersController < ApplicationController
  def create
    waitlist = Waitlist.find_by(
      slug: waitlist_subscriber_params[:waitlist][:slug]
    )
    @waitlist_subscriber = WaitlistSubscriber.new(
      email: waitlist_subscriber_params[:email],
      waitlist: waitlist
    )
    if @waitlist_subscriber.save
      NotifyWaitlistSubscriberJob.perform_later(@waitlist_subscriber.id)
      redirect_to @waitlist_subscriber,
                  notice: _("Merci pour votre inscription sur notre liste.")
    else
      flash.now[:alert] = _("Votre inscription n'a pas pu être enregistrée.")
      return render :new, status: 422
    end
  end

  private

  def waitlist_subscriber_params
    params.require(:waitlist_subscriber).permit(
      :email,
      waitlist: [:slug]
    )
  end
end
