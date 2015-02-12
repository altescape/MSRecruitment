class CandidateMailer < ActionMailer::Base
  default from: "mike@smswmedia.com"

  def welcome_email(candidate)
    @candidate = candidate
    mail(to: @candidate.email, subject: 'Thankyou for applying to M&S')
  end

  def notification_email(candidate)
    @candidate = candidate
    #mail(to: "mnshayat@alhokair.com.sa", subject: 'Someone has applied for a job')
    mail(to: ENV['EMAIL_ADDY'], subject: 'Someone has applied for a job')
  end
end
