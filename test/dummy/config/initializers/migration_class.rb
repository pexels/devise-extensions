# frozen_string_literal: true

MIGRATION_CLASS =
  if Rails.gem_version >= Gem::Version.new('5.0')
    ActiveRecord::Migration[Rails.version.to_f]
  else
    ActiveRecord::Migration
  end
