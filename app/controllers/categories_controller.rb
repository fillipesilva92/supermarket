class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to '/', notice: 'Category was created successfully!'
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def update
    @category = Category.find_by_id(params[:id])

    if @category.update(category_params)
      redirect_to '/', notice: 'Category has been successfully updated'
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def destroy
    @category = Category.find_by_id(params[:id])

    if @category.destroy
      redirect_to '/', notice: 'Category has been successfully deleted'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = current_user.categories.find_by_id(params[:id])
  end
end
