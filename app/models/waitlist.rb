class Waitlist < ApplicationRecord
  has_many :waitlist_subscribers

  validates :slug, uniqueness: true
end
