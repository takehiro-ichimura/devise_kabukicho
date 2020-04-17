class ChangeDmmodel < ActiveRecord::Migration[5.2]
  def change
    remove_columns :dms, :sender_id, :reciever_id
    add_reference :dms, :user, foreign_key: true
    add_reference :dms, :receive_user, foreign_key: { to_table: :users }
  end
end
