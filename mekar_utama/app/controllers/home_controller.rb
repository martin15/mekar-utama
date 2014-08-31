class HomeController < ApplicationController
  def index
    @banners = Banner.order("created_at DESC")
    @best_sellers = ProductImage.where("is_best_seller = true").limit(6)
    @best_clients = Client.where("best_client = true").limit(7)
  end
end
