class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :title
      t.string :body
      t.references :pokemons, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true, type: 'binary(16)'

      t.timestamps
    end

    execute "ALTER TABLE posts MODIFY COLUMN id BINARY(16) DEFAULT (UUID_TO_BIN(UUID(), TRUE))"
  end
end
