class PostPolicy < ApplicationPolicy
  def index?
    admin_or_permission?('view_posts')
  end

  def show?
    admin_or_permission?('view_post')
  end

  def create?
    admin_or_permission?('create_posts')
  end

  def update?
    admin_or_permission?('edit_posts')
  end

end
