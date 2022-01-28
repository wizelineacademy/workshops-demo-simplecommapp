# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
