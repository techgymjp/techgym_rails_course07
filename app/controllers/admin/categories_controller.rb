#coding:UTF-8
class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page])
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, @category], notice: "#{Category.model_name.human}の作成に成功しました。"
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to [:admin, @category], notice: "#{Category.model_name.human}の更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    if @category.destroy
      redirect_to admin_categories_path, notice: "#{Category.model_name.human}の削除に成功しました。"
    else
      redirect_to admin_categories_path, alert: "所属している#{@category.errors.messages[:base].first}。"
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
