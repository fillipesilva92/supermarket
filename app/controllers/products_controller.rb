class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update show destroy]
  before_action :set_category, only: %i[create new edit update]
  
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to '/products', notice: 'Product was successfully created!'
    else
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def update
    if @product.update(product_params)
      redirect_to '/products', notice: 'Product was successfully updated!'
    else
      render :new
    end
  end

  def edit
  end
  
  def show
  end

  def destroy
    if @product.destroy
      redirect_to '/products', notice: 'Product was successfully deleted!'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:barcode, :image, :name, :price, :category_id)
  end

  def set_product
    @product = Product.find_by_id(params[:id])
  end

  def set_category
    @categories = Category.all.map { |category| [category.name, category.id] }
  end
end