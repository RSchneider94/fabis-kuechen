class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def contact_form(name, email, message)
    @message = message
    mail(
        :from => email,
        :to => 'your-email@example.com',
        :subject => "Neue Nachricht von #{ name }"
      )
  end
end
