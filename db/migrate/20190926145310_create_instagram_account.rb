class CreateInstagramAccount < ActiveRecord::Migration[6.0]
  def change
    create_table :instagram_accounts do |t|
      t.string :account_handle, limit: 30
      t.boolean :dog, default: false
      t.boolean :cat, default: false
    end
  end
end
