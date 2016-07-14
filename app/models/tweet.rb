class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true, length: { maximum: 150 }

  scope :lasts, ->{ order(created_at: :desc) }

end
