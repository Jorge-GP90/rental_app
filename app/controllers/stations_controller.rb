class StationsController < ApplicationController
  before_action :set_station, only: %i[ show edit update destroy]
  def index
    @station = Station.all
  end

  def show
  end

  def new
    @staion = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: " Station was successfully created." }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: " Station was successfully updated." }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @station.destroy
    respond_to do |format|
        format.html { redirect_to station_url, notice: " Station was successfully destroyed." }
        format.json { head :no_content }
    end
  end

  private
  def set_station
    @station = Station.find(params[:id])
  end
  
  def station_params
    params.require(:station).permit(:line, :station_name, :minutes)
  end
end
