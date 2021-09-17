#coding:UTF-8
class AdminController < ApplicationController
  prepend_before_action :except_no_admin_user

  private

  def except_no_admin_user
    redirect_to new_admin_admin_user_session_path,
      alert: 'ログインしてください。' unless admin_admin_user_signed_in?
  end
end
