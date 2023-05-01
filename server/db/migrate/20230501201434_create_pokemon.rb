class CreatePokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :name
      t.integer :index
      t.timestamps
    end

    execute "ALTER TABLE pokemon MODIFY COLUMN id BINARY(16) DEFAULT (UUID_TO_BIN(UUID(), TRUE))"
  end
end
