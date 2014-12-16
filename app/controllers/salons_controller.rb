class SalonsController < ApplicationController
  before_action :set_salon, only: [:show, :edit, :update, :destroy]


  def index
    @salons = Salon.all
    @hash = Gmaps4rails.build_markers(@salons) do |salon, marker|
      marker.lat salon.latitude
      marker.lng salon.longitude
      marker.infowindow render_to_string(:partial => "/structures/info_window", :locals => { :structure => salon})
    end
  end

 
  def show
  end

  def new
    @salon = Salon.new
  end


  def edit
  end


  def create
    # @salon = Salon.new(salon_params)

    # respond_to do |format|
    #   if @salon.save
    #     format.html { redirect_to @salon, notice: 'Salon was successfully created.' }
    #     format.json { render :show, status: :created, location: @salon }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @salon.errors, status: :unprocessable_entity }
    #   end
    # end

    params = { term: 'african american natural hair salons'}
    @salons = Yelp.client.search('New York', params).businesses
    @salons.each do |salon|
      salon = Salon.new do |s|
        s.address = [salon.location.address, salon.location.city, salon.location.state_code].join(", ")
        s.phone_number = salon.display_phone
        s.website = salon.url
        s.name = salon.name
        s.description = salon.rating
      end
      salon.save
    end
  end


  def update
    respond_to do |format|
      if @salon.update(salon_params)
        format.html { redirect_to @salon, notice: 'Salon was successfully updated.' }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @salon.destroy
    respond_to do |format|
      format.html { redirect_to salons_url, notice: 'Salon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_salon
      @salon = Salon.find(params[:id])
    end

    def salon_params
      params.require(:salon).permit(:address, :name, :description, :website, :phone_number)
    end
end
