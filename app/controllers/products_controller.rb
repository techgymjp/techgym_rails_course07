#coding:UTF-8
class ProductsController < ApplicationController
  def index
    @search = Product.ransack(search_params)
    @products = @search.result.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @new_evaluation = @product.evaluations.new
  end

  private

  def search_params
    return nil if params[:q].nil?
    q = params.require(:q).permit(:title_or_description_cont_any)
    q[:title_or_description_cont_any] = q[:title_or_description_cont_any].split(/[ 　]/)
    return q
  end
end
