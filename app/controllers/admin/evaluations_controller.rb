#coding:UTF-8
class Admin::EvaluationsController < AdminController
  before_action :set_product

  def destroy
    @evaluation = @product.evaluations.find(params[:id])
    @evaluation.destroy
    redirect_to admin_product_path(@product.id), notice: "#{Evaluation.model_name.human}の削除に成功しました。"
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
