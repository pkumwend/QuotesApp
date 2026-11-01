class RenameCategoryquotesToCategoryQuotes < ActiveRecord::Migration[8.0]
  def change
    rename_table :categoryquotes, :category_quotes
  end
end
