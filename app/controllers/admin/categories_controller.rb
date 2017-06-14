class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end
end
