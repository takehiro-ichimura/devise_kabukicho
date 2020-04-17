class CreateWomanpropaties < ActiveRecord::Migration[5.2]
  def change
    create_table :womanpropaties do |t|
      t.integer :user_id
      t.string :username
      t.integer :shokugyou_id
      t.date :birth_date
      t.integer :height
      t.integer :weight
      t.integer :income

      t.timestamps
    end
  end
end
