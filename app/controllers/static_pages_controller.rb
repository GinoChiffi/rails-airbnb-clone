class StaticPagesController < ApplicationController
  #before_action :authenticate_user!, only: [:landing]

  def landing
    if current_user
      redirect_to home_path
    end
  end

  def home
    if params[:q]
      @q = Item.ransack(params[:q])
      @items = @q.result
    else
      @items = Item.all
    end
  end



  def profile

  end

  def settings
  end

end
