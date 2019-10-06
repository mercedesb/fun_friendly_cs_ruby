class CreateRemoteControl < ActiveRecord::Migration[6.0]
  def change
    create_table :remote_controls do |t|
      t.references :television, foreign_key: true, null: false
    end
  end
end
