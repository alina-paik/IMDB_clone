class UsersController < ApplicationController
  before_action :authentication, except: %i[create]
  before_action :find_user, except: %i[create profile]

  # GET /users/profile
  def profile
    render json: @current_user, status: :ok
  end

  # POST /users
  def create
    user = User.new(user_params)
   if user.save
     token = encode_user_data({ user_id: user.id })
     render json: user
   else
     render json: { message: "invalid credentials" }
   end
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    authorize! @user
    if @user.update(user_update_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:username, :email, :admin).merge(password: BCrypt::Password.create(params[:user][:password]))
  end

  def user_update_params
    params.require(:user).permit(:username, :email)
  end
end
