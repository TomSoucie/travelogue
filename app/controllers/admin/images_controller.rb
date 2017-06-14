class Admin::ImagesController < Admin::BaseController
  def new
    @image = Image.new
  end

  def index
    @images = Image.all
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:success] = "Image created successfully"
      redirect_to images_path
    else
      render :new
    end

  end

  private

  def image_params
    params.require(:image).permit(:description, :url)
  end
end
