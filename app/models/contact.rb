class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :phone
  attribute :message

  # tricking bots
  attribute :nickname, captcha: true

  def headers
    {
      subject: "Prise de contact via le site web (#{name})",
      to: "hello@semisto.org",
      from: "hello@semisto.org",
      reply_to: email
    }
  end
end
