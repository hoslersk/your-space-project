class WelcomeMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
   WelcomeMailer.welcome_email(User.find_by(first_name: "Schyler"))
  end
end
