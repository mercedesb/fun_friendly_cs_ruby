# frozen_string_literal: true

class CreateTree < ActiveRecord::Migration[6.0]
  def change
    create_table :tree_nodes do |t|
      t.string :data
      t.references :parent, index: true, foreign_key: { to_table: :tree_nodes }
    end

    create_table :trees do |t|
      t.references :root, index: true, foreign_key: { to_table: :tree_nodes }
      t.timestamps
    end
  end
end
