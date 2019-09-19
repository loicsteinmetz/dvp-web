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
end
