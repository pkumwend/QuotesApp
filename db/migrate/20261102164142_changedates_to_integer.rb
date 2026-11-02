class ChangedatesToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :sources, :dob, :integer
    change_column :sources, :dod, :integer
  end
end
