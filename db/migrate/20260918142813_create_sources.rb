class CreateSources < ActiveRecord::Migration[8.0]
  def change
    create_table :sources do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.date :dod
      t.string :bio

      t.timestamps
    end
  end
end
