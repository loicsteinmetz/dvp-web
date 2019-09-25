class Admin::FoliosController < ApplicationController

  before_action :authenticate_admin_admin!

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
      flash[:alert] = 'Erreur'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def edit
    @folio = Folio.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @folio = Folio.find(params[:id])
    update = params.permit(:title, :website, :description, :description_mini, :techs, :work)
    @folio.capture.attach(params[:capture]) if !params[:capture].nil?
    if @folio.update(update) || !params[:capture].nil?
      @valid = true
    else
      flash[:alert] = 'Error'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @folio = Folio.find(params[:id])
    @folio.destroy
    respond_to do |format|
      format.js {}
    end
  end

  def order_up
    @folio = Folio.find(params[:id])
    unless @folio.first_place?
      @valid = @folio.order
      Folio.where(order: @folio.order - 1).update(order: @folio.order)
      @folio.update(order: @folio.order - 1)
    end
    respond_to do |format|
      format.js {}
    end
  end

  def order_down
    @folio = Folio.find(params[:id])
    unless @folio.last_place?
      @valid = @folio.order
      Folio.where(order: @folio.order + 1).update(order: @folio.order)
      @folio.update(order: @folio.order + 1)
    end
    respond_to do |format|
      format.js {}
    end
  end

end
