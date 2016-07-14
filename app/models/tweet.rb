class Tweet < ActiveRecord::Base
  belongs_to :user

  scope :lasts, ->{ order(created_at: :desc) }

end
