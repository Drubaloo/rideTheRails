class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :pokemons, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

  end
end
