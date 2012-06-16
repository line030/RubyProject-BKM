class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.json

    def index
    @addresses = Address.all

    country = @addresses.collect { | e |
      e.country ? [e.id, e.country.name] : [e.id, "no Country specified"]
    }
    @countries = Hash[*(country.flatten)]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @address = Address.find(params[:id])
    @country = @address.country

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.json
  def new
    @address = Address.new

    assign_country_selection_list

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  def assign_country_selection_list

    @country_selection_list = Country.all.collect {|country| [ country.name, country.id ] }
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
    assign_country_selection_list
  end

  # POST /addresses
  # POST /addresses.json
  def create

    setName

    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.json { head :no_content }
    end
  end
end
