class RemoveNamesFromCandidates < ActiveRecord::Migration
  def change
    remove_column :candidates, :first_name, :string
    remove_column :candidates, :last_name, :string
  end
end
