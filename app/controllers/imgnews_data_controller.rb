class ImgnewsDataController < ApplicationController
  # GET /imgnews_data
  # GET /imgnews_data.json
  def index
    @imgnews_data = ImgnewsDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imgnews_data }
    end
  end

  # GET /imgnews_data/1
  # GET /imgnews_data/1.json
  def show
    @imgnews_datum = ImgnewsDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @imgnews_datum }
    end
  end

  # GET /imgnews_data/new
  # GET /imgnews_data/new.json
  def new
    @imgnews_datum = ImgnewsDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imgnews_datum }
    end
  end

  # GET /imgnews_data/1/edit
  def edit
    @imgnews_datum = ImgnewsDatum.find(params[:id])
  end

  # POST /imgnews_data
  # POST /imgnews_data.json
  def create
    @imgnews_datum = ImgnewsDatum.new(params[:imgnews_datum])

    respond_to do |format|
      if @imgnews_datum.save
        format.html { redirect_to @imgnews_datum, notice: 'Imgnews datum was successfully created.' }
        format.json { render json: @imgnews_datum, status: :created, location: @imgnews_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @imgnews_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imgnews_data/1
  # PUT /imgnews_data/1.json
  def update
    @imgnews_datum = ImgnewsDatum.find(params[:id])

    respond_to do |format|
      if @imgnews_datum.update_attributes(params[:imgnews_datum])
        format.html { redirect_to @imgnews_datum, notice: 'Imgnews datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @imgnews_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imgnews_data/1
  # DELETE /imgnews_data/1.json
  def destroy
    @imgnews_datum = ImgnewsDatum.find(params[:id])
    @imgnews_datum.destroy

    respond_to do |format|
      format.html { redirect_to imgnews_data_url }
      format.json { head :no_content }
    end
  end
end
