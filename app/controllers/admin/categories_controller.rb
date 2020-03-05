class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create
  end
end
