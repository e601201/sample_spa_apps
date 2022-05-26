class FoodsLoyalty < ApplicationLoyalty
  def update?
    user.role_admin? || user.role_editor?
  end

  def new?
    user.role_admin? || user.role_editor?
  end

  def create?
    user.role_admin? || user.role_editor?
  end

  def update?
    user.role_admin? || user.role_editor?
  end

  def destroy?
    user.role_admin? || user.role_editor?
  end
end
