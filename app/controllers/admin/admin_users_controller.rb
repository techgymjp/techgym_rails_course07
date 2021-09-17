#coding:UTF-8
class Admin::AdminUsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_admin_user!
  authorize_resource

  def index
    @admin_users = AdminUser.page(params[:page])
  end

  def show
  end

  def new
    @admin_user = AdminUser.new
  end

  def edit
  end

  def create
    @admin_user = AdminUser.new(
      {
        role: 'staff',
      }.merge(
        admin_user_params
      )
    )

    if @admin_user.save
      redirect_to [:admin, @admin_user], notice: "#{AdminUser.model_name.human}の作成に成功しました。"
    else
      render :new
    end
  end

  def update
    if @admin_user.update_attributes(
      {
        role: 'staff',
      }.merge(
        admin_user_params
      )
    )
      redirect_to [:admin, @admin_user], notice: "#{AdminUser.model_name.human}の更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    if @admin_user.destroy
      redirect_to admin_admin_users_path, notice: "#{AdminUser.model_name.human}の削除に成功しました。"
    else
      redirect_to admin_admin_users_path, alert: "管理している#{@admin_user.errors.messages[:base].first}。"
    end
  end

  private

  def set_admin_user
    @admin_user = AdminUser.find(params[:id])
  end

  def admin_user_params
    params.require(:admin_user).permit(:name, :email, :password, :password_confirmation)
  end
end
