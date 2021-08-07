class WorksController < ApplicationController
  skip_before_action :login_required, only: %i[index show]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path, success: '投稿しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path, notice: '投稿を更新しました'
    else
      flash.now[:alert] = '投稿の更新に失敗しました'
      render :edit
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy!
    redirect_to works_path, notice: '投稿を削除しました'
  end

  private

  def work_params
    # images:[] とすることで、JSON形式でparamsを受け取れる
    params.require(:work).permit(:title, :description, :material, :size, :weight, { category_ids: [] }, images: [])
  end
end
