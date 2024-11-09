# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  def index?
    is_admin || user_has_permission?('view_posts')
  end

  def show?
    user_has_permission?('view_posts')
  end

  def create?
    user_has_permission?('create_posts')
  end

  def update?
    user_has_permission?('edit_posts')
  end

  def destroy?
    user.group.name == 'Admin'
  end

  private

  def user_has_permission?(permission_name)
    user.permissions.exists?(name: permission_name)
  end
  def is_admin
    user.group.name == 'Admin'
  end
end
