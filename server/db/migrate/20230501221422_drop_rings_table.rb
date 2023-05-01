class DropRingsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :rings
  end

  def down
    create_table :rings do |t|
      t.string :name
      t.string :owner
      t.timestamps
    end
  end
end
