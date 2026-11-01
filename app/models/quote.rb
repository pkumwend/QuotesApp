class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :source 
  has_many :category_quotes, dependent: :destroy
  has_many :categories, through: :category_quotes
  accepts_nested_attributes_for :category_quotes, reject_if: :all_blank, allow_destroy: true

end
