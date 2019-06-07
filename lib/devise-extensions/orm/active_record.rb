# frozen_string_literal: true

module DeviseExtensions
  module Orm
    # This module contains some helpers and handle schema (migrations):
    #
    #   create_table :accounts do |t|
    #     t.password_expirable
    #   end
    #
    module ActiveRecord
      module Schema
        include DeviseExtensions::Schema
      end
    end
  end
end

ActiveRecord::ConnectionAdapters::Table.send :include, DeviseExtensions::Orm::ActiveRecord::Schema
ActiveRecord::ConnectionAdapters::TableDefinition.send :include, DeviseExtensions::Orm::ActiveRecord::Schema
