# frozen_string_literal: true

class Devise::PasswordExpiredController < DeviseController
  skip_before_action :handle_password_change
  before_action :skip_password_change, only: [:show, :update]
  prepend_before_action :authenticate_scope!, only: [:show, :update]

  def show
    respond_with(resource)
  end

  def update
    resource.extend(Devise::Models::DatabaseAuthenticatablePatch)
    resource.password_expired = false

    if resource.update_with_password(resource_params)
      warden.session(scope)['password_expired'] = false
      set_flash_message :notice, :updated
      bypass_sign_in resource, scope: scope
      redirect_to stored_location_for(scope) || :root
    else
      clean_up_passwords(resource)
      respond_with(resource, action: :show)
    end
  end

  private

  def skip_password_change
    return if !resource.nil? && resource.password_expired?
    redirect_to :root
  end

  def resource_params
    permitted_params = [:current_password, :password, :password_confirmation]
    params.require(resource_name).permit(*permitted_params)
  end

  def scope
    resource_name.to_sym
  end

  def authenticate_scope!
    send(:"authenticate_#{resource_name}!")
    self.resource = send("current_#{resource_name}")
  end
end
