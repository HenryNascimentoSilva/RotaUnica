class Excursion < ApplicationRecord
  has_rich_text :description
  validates :name, presence: true, uniqueness: true
end
