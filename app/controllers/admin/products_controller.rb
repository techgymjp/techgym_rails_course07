class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_users, only: [:new, :edit, :create, :update]
  before_action :set_categories, only: [:new, :edit, :create, :update]

  def index
    @products = Product.page(params[:page])
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, @product], notice: "#{Product.model_name.human}の作成に成功しました。"
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, @product], notice: "#{Product.model_name.human}の更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: "#{Product.model_name.human}の削除に成功しました。"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_admin_users
    @admin_users = AdminUser.all
  end

  def set_categories
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(:admin_user_id, :category_id, :title, :description, :image)
  end
end
