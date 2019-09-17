class Admin::AdminController < ApplicationController

  before_action :authenticate_admin_admin!

  def dashboard
    @title = 'DVP Web | Dashboard'
    @contents = Content.all
    @folios = Folio.all
  end
end
