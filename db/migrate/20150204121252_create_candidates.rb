class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :position
      t.binary :resume, limit: 2.megabytes

      t.timestamps
    end
  end
end
