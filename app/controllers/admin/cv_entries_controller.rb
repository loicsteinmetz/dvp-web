class Admin::CvEntriesController < ApplicationController

  def new
    @date = params[:date]
    respond_to do |format|
      format.js {}
    end
  end

  def create
    @date = TimeCv.find(params[:date])
    entry = CvEntry.new(title: params[:title], sub: params[:sub], date: @date)
    if entry.save
      flash[:alert] = nil
      @entry = entry
      @valid = true
    else
      flash[:alert] = 'Erreur'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def edit
    @entry = CvEntry.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @entry = CvEntry.find(params[:id])
    update = params.permit(:title, :sub)
    if @entry.update(update)
      @valid = true
    else
      flash[:alert] = 'Error'
    end
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @entry = CvEntry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.js {}
    end
  end

end
