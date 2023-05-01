class CreateRings < ActiveRecord::Migration[7.0]
  def change
    create_table :rings, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :name
      t.string :owner
      t.datetime :created_at
      t.datetime :updated_at
    end

    execute "ALTER TABLE rings MODIFY COLUMN id BINARY(16) DEFAULT (UUID_TO_BIN(UUID(), TRUE))"
  end
end
