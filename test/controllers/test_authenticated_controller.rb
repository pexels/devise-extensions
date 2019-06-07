# frozen_string_literal: true

require 'test_helper'

class Devise::AuthenticatedControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @controller = FoosController.new
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = User.create!(
      username: 'hello',
      email: 'hello@path.travel',
      password: 'Password4',
      confirmed_at: 5.months.ago
    )
    assert @user.valid?
    sign_in(@user)
  end

  test 'should redirect when password is expired' do
    @user.password_expired!
    get :index
    assert_redirected_to user_password_expired_path
  end
end
