# frozen_string_literal: true

class User < ApplicationRecord

  devise :database_authenticatable,
         :confirmable,
         :omniauthable,
         :password_expirable,
         :recoverable,
         :registerable,
         :rememberable,
         :timeoutable,
         :trackable,
         :validatable

  has_many :widgets

  def some_method_calling_active_record
    ActiveRecord::Base.transaction {}
  end
end
