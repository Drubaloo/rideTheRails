class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end

    execute "ALTER TABLE users MODIFY COLUMN id BINARY(16) DEFAULT (UUID_TO_BIN(UUID(), TRUE))"
  end
end
