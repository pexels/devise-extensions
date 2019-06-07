# frozen_string_literal: true

class CreateTables < MIGRATION_CLASS
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :facebook_token

      # session_limitable
      t.string :unique_session_id

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.boolean :password_expired, null: false, default: false

      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.integer :sign_in_count, default: 0
      t.integer :failed_attempts, default: 0
      t.timestamps null: false
    end
    add_index :users, :password_expired
    add_index :users, :email

    create_table :secure_users do |t|
      t.string :email
      t.string :encrypted_password, null: false, default: ''
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :users
    drop_table :secure_users
  end
end
