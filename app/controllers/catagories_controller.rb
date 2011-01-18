class CatagoriesController < ApplicationController
  before_filter :authenticate_user
  # GET /catagories
  # GET /catagories.xml
  def index
    @catagories = current_user.catagories.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catagories }
    end
  end

  # GET /catagories/1
  # GET /catagories/1.xml
  def show
    @catagory = current_user.catagories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catagory }
    end
  end

  # GET /catagories/new
  # GET /catagories/new.xml
  def new
    @catagory = current_user.catagories.new
    session[:old_uri] = request.referrer
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catagory }
    end
  end

  # GET /catagories/1/edit
  def edit
    @catagory = current_user.catagories.find(params[:id])
  end

  # POST /catagories
  # POST /catagories.xml
  def create
    @catagory = current_user.catagories.build(params[:catagory])
    respond_to do |format|
      if @catagory.save
        if session[:old_uri].nil?
          format.html { redirect_to(@catagory, :notice => 'Catagory was successfully created.') }
        else
          redirect_uri = session[:old_uri]
          puts session[:old_uri]
          session[:old_uri] = nil
          format.html { redirect_to(redirect_uri, :notice => 'Catagory was successfully created.') }
        end
        format.xml  { render :xml => @catagory, :status => :created, :location => @catagory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catagory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catagories/1
  # PUT /catagories/1.xml
  def update
    @catagory = current_user.catagories.find(params[:id])

    respond_to do |format|
      if @catagory.update_attributes(params[:catagory])
        format.html { redirect_to(@catagory, :notice => 'Catagory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catagory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catagories/1
  # DELETE /catagories/1.xml
  def destroy
    @catagory = current_user.catagories.find(params[:id])
    @catagory.destroy

    respond_to do |format|
      format.html { redirect_to(catagories_url) }
      format.xml  { head :ok }
    end
  end
end
