# frozen_string_literal: true

require "devise/orm/active_record"

Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  config.secret_key = 'f08cf11a38906f531d2dfc9a2c2d671aa0021be806c21255d4'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.password_length = 7..128
end
