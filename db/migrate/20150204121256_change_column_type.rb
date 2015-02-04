class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :candidates, :resume, :string
  end
end
