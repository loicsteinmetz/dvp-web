class Admin::AdminController < ApplicationController

  before_action :authenticate_admin_admin!

  def dashboard
    @title = 'DVP Web | Dashboard'
  end
end
