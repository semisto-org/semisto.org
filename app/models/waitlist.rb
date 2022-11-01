class Waitlist < ApplicationRecord
  validates :slug, uniqueness: true
end
