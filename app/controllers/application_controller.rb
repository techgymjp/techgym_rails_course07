#coding:UTF-8
class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    admin_admin_users_path
  end

  def current_ability
    @current_ability || Ability.new(current_admin_admin_user)
  end
end
