class ShowsController < ApplicationController

  def index 
    shows = show.all()
    render json: shows
  end

  def show
    show = Show.find(params[:id])
    render json: show
  end  

  def create
    show = Show.create( animal_params )
    render json: show
  end

  def update
    show = Show.find(params[:id])
    if show.update_attributes(animal_params)
      render :json => show
    end
  end 

  def destroy 
    show = Show.find(params[:id])
    if show.destroy
      render :json => {status: :success}
    else
      render :json => {status: :delete_failed}
    end
  end 

  private 
  def animal_params
    params.require(:show).permit([:title, :series, :description, :image, :programmeID])
  end



end