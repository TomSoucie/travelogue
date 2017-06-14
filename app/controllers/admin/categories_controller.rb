class Admin::CategoriesController < Admin::BaseController

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category created successfully"
      redirect_to admin_categories_path
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
