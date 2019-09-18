class Admin::ContentsController < ApplicationController
  
  def edit
    @content = Content.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @content = Content.find(params[:id])
    update = params.permit(:title, :body)
    @content.update(update)
    redirect_to admin_root_path
  end

end
