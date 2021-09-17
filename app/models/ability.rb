class Ability
  include CanCan::Ability

  def initialize(admin_user)
    admin_user ||= AdminUser.new

    if admin_user.owner?
      can :manage, AdminUser
      #NOTE 全ての権限を与えたため、一度:updateを制限しないと全てのアカウントを編集できてしまう
      cannot :update, AdminUser
      can :update, AdminUser, id: admin_user.id
    else
      can :update, AdminUser, id: admin_user.id
      can :read, AdminUser
    end
  end
end
