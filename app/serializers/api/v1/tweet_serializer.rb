class Api::V1::TweetSerializer < Api::V1::BaseSerializer
  attributes :id, :message
  has_one :user
end
