class Admin::TimeCvsController < ApplicationController

  before_action :authenticate_admin_admin!

  def new
    respond_to do |format|
      format.js { }
    end
  end

  def create
    time_cv = TimeCv.new(date: params[:date])
    if time_cv.save
      flash[:alert] = nil
      @time = time_cv
      @valid = true
    else
      flash[:alert] = 'Erreur'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def edit
    @time = TimeCv.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @time = TimeCv.find(params[:id])
    update = params.permit(:date)
    if @time.update(update)
      @valid = true
    else
      flash[:alert] = 'Error'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @time = TimeCv.find(params[:id])
    @time.destroy
    respond_to do |format|
      format.js {}
    end
  end

  def order_up
    @time = TimeCv.find(params[:id])
    unless @time.first_place?
      @valid = @time.order
      TimeCv.where(order: @time.order - 1).update(order: @time.order)
      @time.update(order: @time.order - 1)
    end
    respond_to do |format|
      format.js {}
    end
  end

  def order_down
    @time = TimeCv.find(params[:id])
    unless @time.last_place?
      @valid = @time.order
      TimeCv.where(order: @time.order + 1).update(order: @time.order)
      @time.update(order: @time.order + 1)
    end
    respond_to do |format|
      format.js {}
    end
  end

end
