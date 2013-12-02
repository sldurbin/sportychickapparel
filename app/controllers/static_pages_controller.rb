class StaticPagesController < ApplicationController
  def home
    @best_sellers = Item.find(:all, :order => "id asc", :limit => 4).reverse
    @new_items = Item.find(:all, :order => "id desc", :limit => 4).reverse 
    @subscriber = Subscriber.new
  end

  def subscribe
    @subscriber = Subscriber.create(subscriber_params)
    @subscriber.save
    redirect_to :root
  end

  def shop
    @items = Item.all
  end

  def help
  end

  def gallery
  end

private

  def subscriber_params 
    params.require(:subscriber).permit(:email)
  end

end
