class Admin::FoliosController < ApplicationController

  def new
    respond_to do |format|
      format.js {}
    end
  end

  def create
    folio = Folio.new(title: params[:title], website: params[:website], description: params[:desc], description_mini: params[:desc_mini], techs: params[:techs], work: params[:work])
    folio.capture.attach(params[:capture])
    if folio.save
      flash[:alert] = nil
      @folio = folio
      @valid = true
    else
      puts '==================', folio.errors.full_messages
      flash[:alert] = 'Erreur'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def order_up
  end

  def order_down
  end

end
