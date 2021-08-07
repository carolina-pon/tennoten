class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path, notice: 'カテゴリーを投稿しました'
    else
      flash.now[:alert] = 'カテゴリーの作成に失敗しました'
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(categories_params)
      redirect_to categories_path, notice: 'カテゴリーを更新しました'
    else
      flash.now[:alert] = 'カテゴリーの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy!
    redirect_to categories_path, notice: 'カテゴリーを削除しました'
  end

  private

  def categories_params
    params.require(:category).permit(:name)
  end
end
