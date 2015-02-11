class AddAreaToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :area, :string
  end
end
