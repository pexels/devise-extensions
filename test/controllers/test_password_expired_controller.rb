# frozen_string_literal: true

require 'test_helper'

class Devise::PasswordExpiredControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = User.create!(
      username: 'hello',
      email: 'hello@path.travel',
      password: 'Password4',
      confirmed_at: 5.months.ago,
      password_expired: true
    )
    assert @user.valid?
    sign_in(@user)
  end

  test 'should render show' do
    get :show
    assert_includes @response.body, 'Renew your password'
  end

  test 'it should redirect if the password is not expired' do
    @user.update!(password_expired: false)
    get :show
    assert_redirected_to root_path
  end

  test 'should update password' do
    put :update, params: {
      user: {
        current_password: 'Password4',
        password: 'Password5',
        password_confirmation: 'Password5'
      }
    }
    @user.reload
    refute @user.password_expired?
    assert_redirected_to root_path
  end

  test 'it should not accept the wrong current password' do
    put :update, params: {
      user: {
        current_password: 'Password',
        password: 'Password5',
        password_confirmation: 'Password5'
      }
    }
    @user.reload
    assert @user.password_expired?
    assert_includes @response.body, 'Renew your password'
  end

  test 'it should not accept an invalid new password' do
    put :update, params: {
      user: {
        current_password: 'Password4',
        password: 'pass',
        password_confirmation: 'pass'
      }
    }
    @user.reload
    assert @user.password_expired?
    assert_includes @response.body, 'Renew your password'
  end
end
