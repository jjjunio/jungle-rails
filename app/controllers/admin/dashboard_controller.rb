class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @product_count = Product.all.length
    @category_count = Category.all.length
  end
end
