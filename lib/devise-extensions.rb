# frozen_string_literal: true

require 'active_record'
require 'active_support/core_ext/integer'
require 'active_support/ordered_hash'
require 'active_support/concern'
require 'devise'

module Devise
  # Number of seconds that passwords are valid (e.g 3.months)
  # Disable pasword expiration with +false+
  # Expire only on demand with +true+
  mattr_accessor :expire_password_after
  @@expire_password_after = 3.months
end

module DeviseExtensions
  autoload :Schema, 'devise-extensions/schema'
  autoload :Patches, 'devise-extensions/patches'

  module Controllers
    autoload :Helpers, 'devise-extensions/controllers/helpers'
  end
end

# modules
Devise.add_module :password_expirable, controller: :password_expirable, model: 'devise-extensions/models/password_expirable', route: :password_expired

# requires
require 'devise-extensions/routes'
require 'devise-extensions/rails'
require "devise-extensions/orm/active_record"
require 'devise-extensions/models/database_authenticatable_patch'
