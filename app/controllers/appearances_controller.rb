class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def show
    @appearance = Appearance.find_by(id: params[:id])
    redirect_to :index unless @appearance
  end

  def new
    @appearance = Appearance.new(id: session[:user_id])
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find_by(id: params[:id])
  end

  def update
    @appearance = Appearance.find_by(id: params[:id])
    if @appearance.update(appearance_params)
      redirect_to appearance_path
    else
      render :edit
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(
      :guest_id, :episode_id, :user_id, :rating
    )
  end

end
