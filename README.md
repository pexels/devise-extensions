# Devise Extensions

Forked from [devise-security](https://github.com/devise-security/devise-security).

## PasswordExpirable
Allows devise models to be marked as having an expired password (and thus require a new password to be set when accessing any authenticated page).

Passwords are only expired on demand by calling `resource.expire_password!`. You can also expire an entire relation at once, eg. `Resource.admin.expire_password!`.

### Schema
```ruby
change_table [resource] do |t|
  t.boolean :password_expired, null: false, default: false
  t.index :password_expired
end
```

## Running tests

Standard tests can be invoked using `rake`. 

## Copyright

Copyright (c) 2011-2017 Marco Scholl. See LICENSE.txt for further details.
