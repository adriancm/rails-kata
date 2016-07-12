class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :lastname, :email, :created_at, :updated_at
end
