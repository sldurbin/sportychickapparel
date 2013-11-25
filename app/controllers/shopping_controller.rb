class ShoppingController < ApplicationController

  def apparel
    begin
      @all_items = Item.where(:apparel_id => params[:apparel_id])
      @items = @all_items.paginate(:page => params[:page])
      @base_filter = "Apparel"
      @base_filter_id = params[:apparel_id]
      @base_filter_cat = Apparel.find(params[:apparel_id])
      respond_to do |format|
        format.html { render 'shopping/shop' }
        format.js { render 'filter' }
      end
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def shoes
    begin
      @all_items = Item.where(:shoe_id => params[:shoe_id])
      @items = @all_items.paginate(:page => params[:page])
      @base_filter = "Shoes"
      @base_filter_id = params[:shoe_id]
      @base_filter_cat = Shoe.find(params[:shoe_id])
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
      @all_items = Item.where(:sport_id => params[:sport_id])
      @items = @all_items.paginate(:page => params[:page])
      @base_filter = "Sports"
      @base_filter_id = params[:sport_id]
      @base_filter_cat = Sport.find(params[:sport_id])
      respond_to do |format|
        format.html { render 'shopping/shop' }
        format.js { render 'filter' }
      end
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def brands 
    begin
      @all_items = Item.where(:brand_id => params[:brand_id])
      @items = @all_items.paginate(:page => params[:page])
      @base_filter = "Brands"
      @base_filter_id = params[:brand_id]
      @base_filter_cat = Brand.find(params[:brand_id])
      respond_to do |format|
        format.html { render 'shopping/shop' }
        format.js { render 'filter' }
      end
    rescue Exception => ex
      flash[:error] = "Unable to display items: #{ex.to_s}"
      redirect_to :root
    end
  end

  def fan_gear 
    begin
      team_ids = League.find_by_id(params[:league_id]).teams.map{ |t| t.id }
      @all_items = Item.where(:team_id => team_ids)
      @items = @all_items.paginate(:page => params[:page])
      @base_filter = "Fan Gear"
      @base_filter_id = params[:league_id]
      @base_filter_cat = League.find(params[:league_id])
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

      (params[:brands].nil?  ? brands = Brand.all.map{ |b| b.id } : brands = params[:brands] ) if base_filter != "Brands"
      (params[:sports].nil?  ? sports = Sport.all.map{ |s| s.id } : sports = params[:sports] ) if base_filter != "Sports"
      (params[:shoes].nil? ? shoes = Shoe.all.map{ |s| s.id }.push(nil) : shoes = params[:shoes] ) if base_filter != "Shoes" 
      (params[:apparel].nil? ? apparel = Apparel.all.map{ |a| a.id }.push(nil) : apparel = params[:apparel] ) if base_filter != "Apparel"

      if base_filter == "Apparel" 
        @items = Item.where("apparel_id" => base_filter_id, \
          :brand_id => brands, :sport_id => sports).paginate(:page => params[:page])
      elsif base_filter == "Shoes"
        @items = Item.where("shoe_id" => base_filter_id, \
          :brand_id => brands, :sport_id => sports).paginate(:page => params[:page])
      elsif base_filter == "Brands"
        @items = Item.where("brand_id" => base_filter_id, :shoe_id => shoes, \
          :sport_id => sports, :apparel_id => apparel).paginate(:page => params[:page])
      elsif base_filter == "Sports"
        @items = Item.where("sport_id" => base_filter_id, :shoe_id => shoes, \
          :brand_id => brands, :apparel_id => apparel).paginate(:page => params[:page])
      elsif base_filter == "Fan Gear"
        @items = Item.where(:team_id => League.find_by_id(base_filter_id).teams.map{ |t| t.id }, :sport_id => sports, \
          :brand_id => brands, :apparel_id => apparel, :shoe_id => shoes).paginate(:page => params[:page])
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
