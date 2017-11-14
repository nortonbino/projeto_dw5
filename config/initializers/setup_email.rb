# if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "mrcondominia@gmail.com",
    :password             => "mrcondominiarails",
    :authentication       => "plain",
    :enable_starttls_auto => true
  }
# end
