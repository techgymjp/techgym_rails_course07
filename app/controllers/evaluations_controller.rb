#coding:UTF-8
class EvaluationsController < ApplicationController
  before_action :set_product

  def create
    @new_evaluation = @product.evaluations.new(evaluation_params)

    if @new_evaluation.save
      redirect_to product_path(@product.id), notice: "#{Evaluation.model_name.human}に成功しました。"
    else
      render 'products/show'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:body, :rate, :title)
  end
end
