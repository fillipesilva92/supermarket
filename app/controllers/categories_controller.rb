class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update show destroy]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to '/categories', notice: 'Category was created successfully!'
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def update
    if @category.update(category_params)
      redirect_to '/categories', notice: 'Category has been successfully updated'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    if @category.destroy
      redirect_to '/categories', notice: 'Category has been successfully deleted'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find_by_id(params[:id])
  end
end
