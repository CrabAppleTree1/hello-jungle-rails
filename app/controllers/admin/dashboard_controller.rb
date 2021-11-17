class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PW']

  def show
    @categories = Category.count(params[:id])
    @products = Product.count(params[:id])
  end
end
