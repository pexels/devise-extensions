# frozen_string_literal: true

require 'test_helper'
require 'rails/generators/test_case'
require 'generators/devise_extensions/install_generator'

class TestInstallGenerator < Rails::Generators::TestCase
  tests DeviseExtensions::Generators::InstallGenerator
  destination File.expand_path('../tmp', __FILE__)
  setup :prepare_destination

  test 'Assert all files are properly created' do
    run_generator
    assert_file 'config/initializers/devise-extensions.rb'
    assert_file 'config/locales/devise.extensions.de.yml'
    assert_file 'config/locales/devise.extensions.en.yml'
    assert_file 'config/locales/devise.extensions.es.yml'
    assert_file 'config/locales/devise.extensions.fr.yml'
    assert_file 'config/locales/devise.extensions.it.yml'
    assert_file 'config/locales/devise.extensions.ja.yml'
    assert_file 'config/locales/devise.extensions.tr.yml'
  end
end
