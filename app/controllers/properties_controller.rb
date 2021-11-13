class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy]  
  def index
    @properties = Property.all
  end

  def show
    @stations = @property.stations
  end

  def new
    @property = Property.new
    2.times {@property.stations.build}
  end

  def edit
    @property.stations.build
  end
  
  def create
    @property = Property.new(property_params)
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Your Property has been register successfully." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Your Property has been updated successfully." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to station_url, notice: " Property was eliminated." }
      format.json { head :no_content }
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property_name, :rent, :address, :age, :remarks, stations_attributes: [:id, :line, :station_name, :minutes, :_destroy])
  end
end
