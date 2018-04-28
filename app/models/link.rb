# link model
class Link < ActiveRecord::Base
  paginates_per 10

  validates :slug, uniqueness: true, presence: true
  validates :given_url, uniqueness: true, presence: true
  validates :clicks, presence: true

  before_validation :generate_slug

  def generate_slug
    loop do
      self.slug = SecureRandom.hex(5)
      break unless self.class.where(slug: slug).exists?
    end
  end
end
