class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: false do |t|
      t.binary :id, limit: 16, primary_key: true
      t.string :body
      t.references :user, null: false, foreign_key: true, type: 'binary(16)'
      t.references :post, null: false, foreign_key: true, type: 'binary(16)'

      t.timestamps
    end

    execute "ALTER TABLE comments MODIFY COLUMN id BINARY(16) DEFAULT (UUID_TO_BIN(UUID(), TRUE))"
  end
end
