class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :tickets, dependent: :destroy
  has_one_attached :image

  attr_accessor :remove_image

  before_save :remove_image_if_user_accept

  validates :name, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 10000 }
  validates :content, presence: true, length: { maximum: 2000 }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_should_be_before_end_at
  validates :image,
    content_type: %i(png jpg jpeg),
    size: { less_than_or_equal_to: 10.megabytes },
    dimension: { width: { max: 2000 }, height: { max: 2000 } }

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  private

  def start_at_should_be_before_end_at
    return unless start_at && end_at
    if start_at >= end_at
      errors.add(:start_at, 'は終了時刻より前の時刻を指定してください')
    end
  end

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)
  end
end
