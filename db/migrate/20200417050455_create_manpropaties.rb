class CreateManpropaties < ActiveRecord::Migration[5.2]
  def change
    create_table :manpropaties do |t|
      t.integer :user_id
      t.string :username
      t.integer :yakushoku_id
      t.date :birth_date
      t.integer :height

      t.timestamps
    end
  end
end
