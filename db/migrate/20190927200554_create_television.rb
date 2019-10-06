class CreateTelevision < ActiveRecord::Migration[6.0]
  def change
    create_table :televisions do |t|
      t.boolean :power, default: false
      t.integer :volume, default: 0
    end
  end
end
