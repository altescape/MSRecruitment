class CandidateMailer < ActionMailer::Base
  default from: "mike@smswmedia.com"

  def welcome_email(candidate)
    @candidate = candidate
    mail(to: @candidate.email, subject: 'Thankyou for applying to M&S')
  end

  def notification_email(candidate)
    @candidate = candidate
    mail(to: "mike@smswmedia.com", subject: 'Someone has applied for a job')
  end
end
