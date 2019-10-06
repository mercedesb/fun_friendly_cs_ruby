class CreateLinkedList < ActiveRecord::Migration[6.0]
  def change
    create_table :nodes do |t|
      t.string :data
      t.references :next, index: true, foreign_key: { to_table: :nodes }
    end

    create_table :lists do |t|
      t.references :head, index: true, foreign_key: { to_table: :nodes }
      t.references :tail, index: true, foreign_key: { to_table: :nodes }
      t.timestamps
    end
  end
end
