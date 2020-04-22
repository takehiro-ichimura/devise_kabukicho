class AddAndDeleteColumnsToWomanPropaty < ActiveRecord::Migration[5.2]
  def change
    remove_column :womanpropaties, :shokugyou_id, :integer
    add_column :womanpropaties, :shokugyou, :string
  end
end
