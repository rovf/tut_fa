class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index,:edit,:update,:destroy]
  before_action :correct_user,   only: [:edit,:update]
  before_action :admin_user, only: [:destroy]

  def new
     @user=User.new
  end
  def index
     # The :page parameter can be nil (for example, on first invocation). In this case,
     # paginate returns the first page.
     @users=User.paginate(page: params[:page], per_page: 16).order('name ASC')
  end
  def show
     @user=User.find(params[:id])
     @microposts=@user.microposts.paginate(page:params[:page])
  end
  def create
     # The following ("parameter mass assignment", because params[:user]
     # is a hash) worked in Rails 3, but it is forbidden in Rails 4
     # ("ActiveModel::ForbiddenAttributesError") for security reason.
     @user=User.new(user_params)
     if @user.save
        sign_in @user
        flash[:success]='You are in!'
        redirect_to @user
     else
        render 'new'
     end
  end
  def edit
     # @user is set in before_action
  end
  def update
     # @user is set in before_action
     if @user.update_attributes(user_params)
        flash[:success]='Profile updated'
        redirect_to @user
     else
        render 'edit'
     end
  end
  def destroy
     User.find(params[:id]).destroy
     flash[:success]="User deleted"
     redirect_to users_url
  end

private

  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Side effect: Sets @user
  def correct_user
     @user = User.find(params[:id])
     redirect_to root_url unless current_user?(@user)
  end

  def admin_user
     redirect_to root_url unless current_user.admin?
  end

end
