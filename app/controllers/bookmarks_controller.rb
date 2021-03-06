class BookmarksController < ApplicationController
  before_filter :authenticate_user
  # GET /bookmarks
  # GET /bookmarks.xml
  def index
    @bookmarks = current_user.bookmarks(:all, :conditions => {:order => "weight DESC"})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookmarks }
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.xml
  def show
    @bookmark = current_user.bookmarks.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.xml
  def new
    @bookmark = current_user.bookmarks.new
    @title = params[:t]
    @link = params[:l]
    @popup = (params[:p] == '1')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = current_user.bookmarks.find(params[:id])
    @catagories = current_user.catagories || []
  end

  # POST /bookmarks
  # POST /bookmarks.xml
  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to(root_path, :notice => 'Bookmark was successfully created.') }
        format.xml  { render :xml => @bookmark, :status => :created, :location => @bookmark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.xml
  def update
    @bookmark = current_user.bookmarks.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(admin_path, :notice => 'Bookmark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.xml
  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to(bookmarks_url) }
      format.xml  { head :ok }
    end
  end
  
end
