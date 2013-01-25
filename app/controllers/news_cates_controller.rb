class NewsCatesController < ApplicationController
  skip_before_filter :authorize_type, :except => [:edit,:create,:destory]
  # GET /news_cates
  # GET /news_cates.json
  def index
    @count = NewsCate.all.count
    if(@count>0)
      @news_cates = NewsCate.all
    else
      flash[:notice] = "sorry! there are not  data ! ! !"
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_cates }
    end
  end

  # GET /news_cates/1
  # GET /news_cates/1.json
  def show
    @news_cate = NewsCate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news_cate }
    end
  end

  # GET /news_cates/new
  # GET /news_cates/new.json
  def new
    @news_cate = NewsCate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news_cate }
    end
  end

  # GET /news_cates/1/edit
  def edit
    @news_cate = NewsCate.find(params[:id])
  end

  # POST /news_cates
  # POST /news_cates.json
  def create
    @news_cate = NewsCate.new(params[:news_cate])

    respond_to do |format|
      if @news_cate.save
        format.html { redirect_to @news_cate, notice: 'News cate was successfully created.' }
        format.json { render json: @news_cate, status: :created, location: @news_cate }
      else
        format.html { render action: "new" }
        format.json { render json: @news_cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news_cates/1
  # PUT /news_cates/1.json
  def update
    @news_cate = NewsCate.find(params[:id])

    respond_to do |format|
      if @news_cate.update_attributes(params[:news_cate])
        format.html { redirect_to @news_cate, notice: 'News cate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_cates/1
  # DELETE /news_cates/1.json
  def destroy
    @news_cate = NewsCate.find(params[:id])
    @news_cate.destroy

    respond_to do |format|
      format.html { redirect_to news_cates_url }
      format.json { head :no_content }
    end
  end
end
