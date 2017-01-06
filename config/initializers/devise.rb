# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = 'd305d4041f32cda4029692af98d806312ef01f914c4b297838c2c78a6aa29754f63ef3f74e4fe806e3787d768dbfdc83c4e224081c9e9b2f1d9f0d19f571950f'


  #OmniAuth with Facebook
  config.omniauth :facebook, "348967242153046", "82e7f998f2a0e75e8577c28395e9b904", callback_url: "http://localhost:3000/signin-facebook"

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  
  require 'devise/orm/active_record'

 
  config.case_insensitive_keys = [:email]
  
  config.strip_whitespace_keys = [:email]
  
  config.skip_session_storage = [:http_auth]

  config.scoped_views = true
  
  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true
  
  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours
  
  config.sign_out_via = :delete

  
end
