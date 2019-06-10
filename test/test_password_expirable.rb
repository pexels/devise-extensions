# frozen_string_literal: true

require 'test_helper'

class TestPasswordArchivable < ActiveSupport::TestCase
  test 'password can be expired' do
    user = User.create email: 'bob@microsoft.com', password: 'Password1', password_confirmation: 'Password1'
    refute user.password_expired?
    user.expire_password!
    assert user.password_expired?
  end

  test 'updating a record does not unexpire the password if the password was not changed' do
    user = User.create email: 'bob@microsoft.com', password: 'Password1', password_confirmation: 'Password1'
    user.expire_password!
    user.update!(email: 'john@microsoft.com')
    assert user.password_expired?
  end

  test 'a relation can be expired' do
    User.create email: 'first@example.com', password: 'Password1', password_confirmation: 'Password1'
    User.create email: 'second@example.com', password: 'Password1', password_confirmation: 'Password1'
    User.expire_passwords!

    User.all.each do |user|
      assert user.password_expired?
    end
  end
end
