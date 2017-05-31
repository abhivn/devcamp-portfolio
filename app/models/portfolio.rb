class Portfolio < ApplicationRecord

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
end
