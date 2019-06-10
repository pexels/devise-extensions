# frozen_string_literal: true

require 'devise-extensions/hooks/password_expirable'

module Devise::Models
  # PasswordExpirable makes passwords able to be expired on demand.
  # This is useful to force users to change passwords for complex business reasons.
  # Call +expire+ to indicate a record needs a new password.
  module PasswordExpirable
    extend ActiveSupport::Concern

    included do
      scope :with_expired_password, -> { where(password_expired: true) }
      scope :without_expired_password, -> { where.not(password_expired: true) }
    end

    def expire_password
      self.password_expired = true
    end
    alias password_expired expire_password

    def expire_password!
      update_column(:password_expired, true)
    end
    alias password_expired! expire_password!

    module ClassMethods
      def expire_password!
        update_all(password_expired: true)
      end
      alias password_expired! expire_password!
      alias expire_passwords! expire_password!
    end
  end
end
