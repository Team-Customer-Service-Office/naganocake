class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      @categories = Category.all
      render :index, notice: '新規登録が完了しました。'
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
  end

  def update
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
