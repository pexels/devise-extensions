# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'pry'
require 'dummy/config/environment'
require 'minitest/autorun'
require 'rails/test_help'
require 'devise-extensions'
require 'database_cleaner'
require "orm/active_record"
require 'support/integration_helpers'

class Minitest::Test
  def before_setup
    DatabaseCleaner.start
  end

  def after_teardown
    DatabaseCleaner.clean
  end
end

DatabaseCleaner.clean
