class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
      t.string :key
      t.string :url
      t.string :ip
      t.timestamps
    end
  end

  def down
    drop_table :requests
  end
end
