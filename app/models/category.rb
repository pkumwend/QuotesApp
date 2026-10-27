class Category < ApplicationRecord 
    has_many :quotes, through: :category_quotes
    has_many :category_quotes, dependent: :destroy
end
