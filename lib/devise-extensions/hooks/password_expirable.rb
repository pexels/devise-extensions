# frozen_string_literal: true

Warden::Manager.after_set_user do |record, warden, options|
  if record.respond_to?(:password_expired?)
    warden.session(options[:scope])['password_expired'] = record.password_expired?
  end
end
