class Admin::AdminsController < AdminController
  before_action :authenticate_user!
  before_action :require_admin

  def index
  end
end
