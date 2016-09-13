class NotificationMailerPreview < ActionMailer::Preview
  def notification_mail_preview
   NotificationMailer.notification_email(User.find_by(first_name: "Schyler"))
  end
end
