class CategoriesController < ApplicationController
  before_action :authentication, except: %i[index show]
  before_action :find_category, only: %i[show update destroy]
  # GET /categories?page=:page
  def index
    @categories = Category.page(params[:page])
    render json: @categories
  end

  # GET /categories/:id
  def show
    render json: @category, status: :ok
  end

  # POST /categories
  def create
    authorize!
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  # PATCH /categories/:id
  def update
    authorize! @category
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  #DEL /categories/:id
  def destroy
    authorize! @category
    @category.destroy
  end

  private
  def find_category
    @category = Category.find_by(id: params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
end
