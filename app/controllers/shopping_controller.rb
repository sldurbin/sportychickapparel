class ShoppingController < ApplicationController

  def apparel
    begin
      @items = Item.where(:apparel_id => params[:apparel_id]).paginate(:page => params[:page])
      @base_filter = "apparel_id"
      @base_filter_id = params[:apparel_id]
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def sports
    begin
      @items = Sport.find_by_id(params[:sport_id]).items.paginate(:page => params[:page])
      @base_filter = "sport_id"
      @base_filter_id = params[:sport_id]
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def brands 
    begin
      @items = Brand.find_by_id(params[:brand_id]).items.paginate(:page => params[:page])
      @base_filter = "brand_id"
      @base_filter_id = params[:brand_id]
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def fan_gear 
    begin
      @items = League.find_by_id(params[:league_id]).items.paginate(:page => params[:page])
      @base_filter = "league_id"
      @base_filter_id = params[:league_id]
      render 'static_pages/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end


  def filter
#    begin
      base_filter = params[:base_filter]
      base_filter_id = params[:base_filter_id]

      (params[:brands].nil?  ? brands = Brand.all.map{ |b| b.id } : brands = params[:brands] ) if base_filter != "brand_id"
      (params[:sports].nil?  ? sports = Sport.all.map{ |s| s.id } : sports = params[:sports] ) if base_filter != "sport_id"

      if base_filter == "apparel_id" 
        @items = Item.where("apparel_id" => base_filter_id, \
          :brand_id => brands, :sport_id => sports).paginate(:page => params[:page])
      elsif base_filter == "brand_id"
        @items = Item.where("brand_id" => base_filter_id, \
          :sport_id => sports).paginate(:page => params[:page])
      elsif base_filter == "sport_id"
        @items = Item.where("sport_id" => base_filter_id, \
          :brand_id => brands).paginate(:page => params[:page])
      else 

      end
      respond_to do |format|
        format.html { redirect_to '/static_pages/home' }
        format.js
      end
#    rescue Exception => ex
#      flash[:error] = "Invalid filter: #{ex.to_s}"
      #TODO: redirect to better page
#      redirect_to :root
#    end
  end
end
