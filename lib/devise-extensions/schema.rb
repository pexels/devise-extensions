# frozen_string_literal: true

module DeviseExtensions
  # add schema helper for migrations
  module Schema
    # Add password_changed_at columns in the resource's database table.
    #
    # Examples
    #
    # # For a new resource migration:
    # create_table :user do |t|
    #   t.password_expirable
    # ...
    # end

    def password_expirable
      apply_devise_schema :password_expired, ActiveModel::Type::Boolean
    end
  end
end
