class ShoppingController < ApplicationController

  def apparel
    begin
      @items = Apparel.find_by_id(params[:apparel_id]).items
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def sports
    begin
      @items = Sport.find_by_id(params[:sport_id]).items
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def brands 
    begin
      @items = Brand.find_by_id(params[:brand_id]).items
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end
end
