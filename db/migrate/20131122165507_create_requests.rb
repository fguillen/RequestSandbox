class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
      t.string :key
      t.text :info

      t.timestamps
    end
  end

  def down
    drop_table :requests
  end
end
