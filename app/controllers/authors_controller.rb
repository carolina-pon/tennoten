class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(authors_params)
    if @author.save
      redirect_to authors_path, notice: '作者を投稿しました'
    else
      flash.now[:alert] = '作者の作成に失敗しました'
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(authors_params)
      redirect_to authors_path, notice: '作者を更新しました'
    else
      flash.now[:alert] = '作者の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy!
    redirect_to authors_path, notice: '作者を削除しました'
  end

  private

  def authors_params
    params.require(:author).permit(:name, :site, :sns)
  end
end
