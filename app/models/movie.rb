class Movie < ApplicationRecord
  # has_many :bookmarks, dependent: :restrict_with_error
  # has_many :bookmarks, dependent: :restrict_with_exception
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
  validates :poster_url, presence: true, format: URI::regexp(%w[http https])
  validates :rating, presence: true, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  before_validation :set_defaults

  private

  def set_defaults
    self.poster_url ||= "https://example.com/default-poster.jpg"
    self.rating ||= 5.0
  end
end
