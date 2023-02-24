class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :category_payments
  has_and_belongs_to_many :categories, through: :category_payments


  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
