class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:destroy]
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  # POST /microposts
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
       flash[:success]="Micropost created"
       redirect_to root_url
    else
       @feed_items = []
       render 'static_pages/home'
    end
  end


  # DELETE /microposts/1
  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
       # Use find_by instead of find to avoid the possibility of an exception.
       # Alternatively we could rescue the exception.
       @micropost = current_user.microposts.find_by(id: params[:id])
       redirect_to root_url if @micropost.nil?
    end
end
