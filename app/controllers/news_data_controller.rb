class NewsDataController < ApplicationController
  skip_before_filter :authorize_type, :only => [:index,:find,:show]
  # GET /news_data
  # GET /news_data.json
  def index
    @news_data = NewsDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_data }
    end
  end

  # GET /news_data/1
  # GET /news_data/1.json
  def show
    @news_datum = NewsDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news_datum }
    end
  end

  # GET /news_data/new
  # GET /news_data/new.json
  def new
    @news_datum = NewsDatum.new
    @news_cates = NewsCate.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news_datum }
    end
  end

  # GET /news_data/1/edit
  def edit
    @news_datum = NewsDatum.find(params[:id])
    @news_cates = NewsCate.all
  end

  # POST /news_data
  # POST /news_data.json
  def create
    @news_cate = NewsCate.find(params[:news_cate_id])
    @news_datum = NewsDatum.new(params[:news_datum])
    @news_datum.news_cate = @news_cate
    respond_to do |format|
      if @news_datum.save
        format.html { redirect_to @news_datum, notice: 'News datum was successfully created.' }
        format.json { render json: @news_datum, status: :created, location: @news_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @news_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news_data/1
  # PUT /news_data/1.json
  def update
    @news_datum = NewsDatum.find(params[:id])

    respond_to do |format|
      if @news_datum.update_attributes(params[:news_datum])
        format.html { redirect_to @news_datum, notice: 'News datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_data/1
  # DELETE /news_data/1.json
  def destroy
    @news_datum = NewsDatum.find(params[:id])
    @news_datum.destroy

    respond_to do |format|
      format.html { redirect_to news_data_url }
      format.json { head :no_content }
    end
  end

  def find
    @news_data = NewsDatum.where("news_cate_id = ? ",params[:news_cate_id]).limit(5);
    respond_to do |format|
      format.html # find.html.erb
      format.json { render json: @news_data }
    end
  end

    def find2
      @news_catename = params[:news_catename]
      @count = NewsDatum.where("news_cate_id = ? ",params[:news_cate_id]).count
      if(@count>0)
        @news_data = NewsDatum.where("news_cate_id = ? ",params[:news_cate_id]).limit(5);
      else
        flash[:notice] = "sorry! there are not  data ! ! !"
      end
      respond_to do |format|
        format.html # find.html.erb
        format.json { render json: @news_data }
      end
    end
end
