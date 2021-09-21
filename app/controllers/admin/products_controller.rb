class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.page(params[:page])
  end

  def show
  end

  def new
    @product = Product.new
    @admin_users = AdminUser.all
    @categories = Category.all
  end

  def edit
    @admin_users = AdminUser.all
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @admin_users = AdminUser.all
    @categories = Category.all

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

    def product_params
      params.require(:product).permit(:admin_user_id, :category_id, :title, :description)
    end
end
