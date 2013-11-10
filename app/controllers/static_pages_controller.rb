class StaticPagesController < ApplicationController
  def home
  end

  def shop
    @items = Item.all
  end

  def help
  end

  def gallery
  end
end
