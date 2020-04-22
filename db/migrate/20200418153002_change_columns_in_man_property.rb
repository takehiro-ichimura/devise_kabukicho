class ChangeColumnsInManProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :manpropaties, :yakushoku_id, :integer
    add_column :manpropaties, :tenmei, :string
    add_column :manpropaties, :yakushoku, :string
    add_column :manpropaties, :geinoujin, :string
    add_column :manpropaties, :honei, :boolean, default: false, null: false
    add_column :manpropaties, :tomoei, :boolean, default: false, null: false
    add_column :manpropaties, :nomikei, :boolean, default: false, null: false
    add_column :manpropaties, :owaraikei, :boolean, default: false, null: false
    add_column :manpropaties, :senden, :string
  end
end
