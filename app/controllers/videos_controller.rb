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
   #require 'pry'; binding.pry

    @results = Video.video_search(params[:search_term])

    if @results
      redirect_to search_path, notice: 'All good!'
    else
      flash[:error] = "There's an error in your request"
      redirect_to search_path
    end

  end





end