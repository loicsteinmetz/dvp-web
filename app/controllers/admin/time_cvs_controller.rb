class Admin::TimeCvsController < ApplicationController
  def new
    respond_to do |format|
      format.js {}
    end
  end

  def create
    cv_time = TimeCv.new(date: params[:date])
    cv_time.order = TimeCv.set_new_order;
    if cv_time.save
      flash[:alert] = nil
      @time = cv_time
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
      time_ref = @time.order
      @time.update(order: -1)
      TimeCv.reorder_down(time_ref)
      @time.update(order: time_ref - 1)
      @valid = time_ref
    end
    respond_to do |format|
      format.js {}
    end
  end

  def order_down
    @time = TimeCv.find(params[:id])
    unless @time.last_place?
      time_ref = @time.order
      @time.update(order: -1)
      TimeCv.reorder_up(time_ref)
      @time.update(order: time_ref + 1)
      @valid = time_ref
    end
    respond_to do |format|
      format.js {}
    end
  end

end
