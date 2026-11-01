class AddVisibilityToQuotes < ActiveRecord::Migration[8.0]
  def change
    add_column :quotes, :is_public, :boolean, default: true, null: false
  end
end
