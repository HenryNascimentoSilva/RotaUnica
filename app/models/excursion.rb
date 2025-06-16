class Excursion < ApplicationRecord
  has_one_attached :featured_image
  has_rich_text :description
  validates :name, presence: true, uniqueness: true
end
