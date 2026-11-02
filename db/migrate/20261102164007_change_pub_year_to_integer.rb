class ChangePubYearToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :quotes, :pub_year, :integer
  end
end
