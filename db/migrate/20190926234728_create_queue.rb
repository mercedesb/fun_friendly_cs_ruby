class CreateQueue < ActiveRecord::Migration[6.0]
  def change
    create_table :queues do |t|
      t.references :head, index: true, foreign_key: { to_table: :nodes }
      t.references :tail, index: true, foreign_key: { to_table: :nodes }
      t.timestamps
    end
  end
end
