# frozen_string_literal: true

module DeviseExtensions
  module Generators
    # Generator for Rails to create or append to a Devise initializer.
    class InstallGenerator < Rails::Generators::Base
      LOCALES = %w[en es de fr it ja tr].freeze

      source_root File.expand_path('../../templates', __FILE__)
      desc 'Install the devise extensions'

      def copy_initializer
        template('devise-extensions.rb',
                 'config/initializers/devise-extensions.rb',
        )
      end

      def copy_locales
        LOCALES.each do |locale|
          copy_file(
            "../../../config/locales/#{locale}.yml",
            "config/locales/devise.extensions.#{locale}.yml",
          )
        end
      end
    end
  end
end
