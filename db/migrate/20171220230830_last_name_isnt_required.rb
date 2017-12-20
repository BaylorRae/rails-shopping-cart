class LastNameIsntRequired < ActiveRecord::Migration[5.1]
  def up
    change_column :orders, :last_name, :string, null: true
  end

  def down
    change_column :orders, :last_name, :string, null: false
  end
end
