class StocksController < ApplicationController
  before_action :set_stock, only: %i[edit update show destroy]
  before_action :set_product, only: %i[create new edit update]
  
  def index
    @stocks = Stock.all
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      redirect_to '/stocks', notice: 'Product was sucessfully created!'
    else
      render :new
    end
  end

  def new
    @stock = Stock.new
  end

  def update
    if @stock.update(stock_params)
      redirect_to '/stocks', notice: 'Product was successfully updated!'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    if @stock.destroy
      redirect_to '/stocks', notice: 'Product was successfully deleted!'
    else
      render :new
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:quantity, :product_id)
  end

  def set_stock
    @stock = Stock.find_by_id(params[:id])
  end

  def set_product
    @products = Product.all.map { |product| [product.name, product.id] }
  end
end