class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:me]

  # GET api/v1/users
  def index
    @users = User.all
    render json: ActiveModel::Serializer::CollectionSerializer.new(@users, serializer: Api::V1::UserSerializer, root: 'users')
  end

  # GET api/v1/users/me
  def me
    render json: Api::V1::UserSerializer.new(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end
end
