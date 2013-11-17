class ShoppingController < ApplicationController

  def apparel
    begin
      @items = Item.where(:apparel_id => params[:apparel_id]).paginate(:page => params[:page], :per_page => 2)
      @base_filter = "apparel_id"
      @base_filter_id = params[:apparel_id]
      respond_to do |format|
        format.html { render 'shopping/shop' }
        format.js { render 'filter' }
      end
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def sports
    begin
      @items = Item.where(:sport_id => params[:sport_id]).paginate(:page => params[:page])
      @base_filter = "sport_id"
      @base_filter_id = params[:sport_id]
      render 'shopping/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def brands 
    begin
      @items = Item.where(:brand_id => params[:brand_id]).paginate(:page => params[:page])
      @base_filter = "brand_id"
      @base_filter_id = params[:brand_id]
      render 'shopping/shop'
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def fan_gear 
    begin
      team_ids = League.find_by_id(params[:league_id]).teams.map{ |t| t.id }
      @items = Item.where(:team_id => team_ids).paginate(:page => params[:page])
      @base_filter = "league_id"
      @base_filter_id = params[:league_id]
      render 'shopping/shop'
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
      (params[:apparel].nil? ? apparel = Apparel.all.map{ |a| a.id } : apparel = params[:apparel] ) if base_filter != "apparel_id"

      if base_filter == "apparel_id" 
        @items = Item.where("apparel_id" => base_filter_id, \
          :brand_id => brands, :sport_id => sports).paginate(:page => params[:page], :per_page => 2)
      elsif base_filter == "brand_id"
        @items = Item.where("brand_id" => base_filter_id, \
          :sport_id => sports, :apparel_id => apparel).paginate(:page => params[:page])
      elsif base_filter == "sport_id"
        @items = Item.where("sport_id" => base_filter_id, \
          :brand_id => brands, :apparel_id => apparel).paginate(:page => params[:page])
      elsif base_filter == "league_id"
        @items = Item.where(:team_id => League.find_by_id(base_filter_id).teams.map{ |t| t.id }, :sport_id => sports, \
          :brand_id => brands, :apparel_id => apparel).paginate(:page => params[:page])
      else 

      end
      respond_to do |format|
        format.html { render 'shopping/shop' }
        format.js
      end
#    rescue Exception => ex
#      flash[:error] = "Invalid filter: #{ex.to_s}"
      #TODO: redirect to better page
#      redirect_to :root
#    end
  end
end
