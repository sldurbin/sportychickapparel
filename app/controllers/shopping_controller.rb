class ShoppingController < ApplicationController

  def apparel
    begin
      @items = Item.where(:apparel_id => params[:apparel_id]).paginate(:page => params[:page])
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

  def fan_gear 
    begin
      @items = League.find_by_id(params[:league_id]).items
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end


  def brand_filter
    respond_to do |format|
      format.html { redirect_to '/static_pages/home' }
      format.js
    end
  end
end
