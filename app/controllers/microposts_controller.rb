class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:destroy]
  before_action :signed_in_user

  # POST /microposts
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
       flash[:success]="Micropost created"
       redirect_to_root_url
    else
       render
    end
  end


  # DELETE /microposts/1
  def destroy
    @micropost.destroy
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
end
