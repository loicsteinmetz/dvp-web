class Admin::ContentsController < ApplicationController
  
  def edit
    @content = Content.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

end
