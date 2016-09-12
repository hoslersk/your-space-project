class CancellationMailerPreview < ActionMailer::Preview
  def cancellation_mail_preview
   CancellationMailer.cancellation_email(User.find_by(first_name: "Schyler"))
  end
end
