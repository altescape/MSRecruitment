class AddExperienceToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :experience, :string
  end
end
