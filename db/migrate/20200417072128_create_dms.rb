class CreateDms < ActiveRecord::Migration[5.2]
  def change
    create_table :dms do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string :content

      t.timestamps
    end
  end
end
