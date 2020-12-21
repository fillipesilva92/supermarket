class CheckoutsController < ApplicationController
  before_action :set_checkout, only: %i[edit update show destroy]

  def index
    @checkout = Checkout.all
  end

  def create
    @checkout = Checkout.new(checkout_params)

    if @checkout.save
      redirect_to '/checkouts', notice: 'Sale was successful!'
    else
      render :new
    end
  end

  def new
    @checkout = Checkout.new
  end

  def update
    if @checkout.update(checkout_params)
      redirect_to '/checkouts', notice: 'Sale has been updated successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    if @checkout.destroy
      redirect_to '/checkouts', notice: 'Sale was successfully deleted!'
    else
      render :new
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:user_id, :total, :products, :created_at, :payment_method, :change)
  end

  def set_checkout
    @checkout = Checkout.find_by_id(params[:id])
  end 

end
