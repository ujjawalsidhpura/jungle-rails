class Admin::CategoriesController < ApplicationController

  before_filter :authenticate

  def index
    @category = Category.order(id: :desc).all
  end
  
  def show
    @category = Category.all
    @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  def authenticate
    authenticate_or_request_with_http_basic('admin/dashboard') do |username, password|
      username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
    end
  end

end
