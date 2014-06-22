class UsersController < ApplicationController
  def new
     @user=User.new
  end
  def show
     @user=User.find(params[:id])
  end
  def create
     # The following ("parameter mass assignment", because params[:user]
     # is a hash) worked in Rails 3, but it is forbidden in Rails 4
     # ("ActiveModel::ForbiddenAttributesError") for security reason.
     @user=User.new(user_params)
     if @user.save
        flash[:success]='You are in!'
         redirect_to @user
     else
         render 'new'
     end
  end

  private

  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
