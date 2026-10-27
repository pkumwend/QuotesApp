class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :source 
  has_many :category_quotes, dependent: :destroy
  has_many :categories, through: :category_quotes
end
