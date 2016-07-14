class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :username, :name, :lastname, :email, :created_at, :updated_at
end
