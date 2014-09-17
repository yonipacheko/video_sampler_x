class VideosController < ApplicationController

  def index
    @categories = Category.all
    @videos = Video.all

  end

  def create

  end

  def show

  end

  def search

    @results = Video.video_search(params[:search_term])

    if @results
      flash[:notice] = 'All good!'
      render :search
    else
      @results = []
      flash[:error] = "There's an error in your request"
      render :search
    end

  end





end