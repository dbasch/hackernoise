class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  def create
    u = User.find(params[:post][:user])
    params[:post][:user] = u
    @post = Post.new(params[:post])
    if @post.save
      # ...
      @posts = Post.find(:all, :order => 'created_at DESC')
      render 'home/index'
      #TODO: go to your submission
    else
      @post.errors.full_messages.each do |e|
        flash.now[:error] = e
      end
      render :new
    end
  rescue Exception => ex
    logger.warn('ERROR: ' + ex.message)
    flash.now[:error] = 'There was an error creating the post.'
    render :new
  end

  def new
  end

  def delete
  end

  def up
  end

  def down
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end


end
