class UsersController < ApplicationController


    def create 
        a = User.create(
            name: params[:name],
            password: params[:password]
        )
        token = encode(a.id)
        render json: {user: a, token: token}

    end

    def me
        token = request.headers['token']
        user_id = decode(token)
        user = User.find(user_id)
        token = encode(user.id)
        render json: {user: user, token: token}
    end


def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end
  
  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end


end
