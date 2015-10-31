class AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  layout 'admin/admin'

  def admin
  end

end
