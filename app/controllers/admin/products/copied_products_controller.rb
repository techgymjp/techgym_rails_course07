class Admin::Products::CopiedProductsController < AdminController
  before_action :set_origin_product

  def new
    @admin_users = AdminUser.all
    @categories = Category.all
    @copied_product = @origin_product.copied_product.new(
      category_id: @origin_product.category_id,
      title: @origin_product.title,
      description: @origin_product.description,
    )
  end

  def create
    @admin_users = AdminUser.all
    @categories = Category.all
    @copied_product = @origin_product.copied_product.new(copied_product_params)

    if @copied_product.save
      redirect_to [:admin, @copied_product], notice: "#{Product.model_name.human}の複製に成功しました。"
    else
      render :new
    end
  end

  private

  def copied_product_params
    params.require(:product).permit(:admin_user_id, :image, :category_id, :title, :description)
  end

  def set_origin_product
    _origin_product = Product.find(set_request_product_id)

    if _origin_product.origin_id.present?
      @origin_product = Product.find(_origin_product.origin_id)
    else
      @origin_product = _origin_product
    end
  end

  def set_request_product_id
    @request_product_id = params[:product_id]
  end
end
