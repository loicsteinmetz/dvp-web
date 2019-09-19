class Admin::AdminController < ApplicationController

  before_action :authenticate_admin_admin!

  def dashboard
    @title = 'DVP Web | Dashboard'
    @contents = Content.order(id: :asc)
    @folios = Folio.all
    @times = TimeCv.all.order(order: :asc)
  end
end
