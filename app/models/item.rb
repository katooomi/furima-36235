class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.imafe.attached?
  end
end
