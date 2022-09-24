class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to new_contact_path,
                  notice: _("Merci pour votre message. Nous vous répondons très prochainement!")
    else
      flash.now[:alert] = _("Le message n'a malheureusement pas pu être envoyé. Pourriez-vous nous l'envoyer à hello@semisto.org? Merci!")
      render :new, status: 422
    end
  end
end
