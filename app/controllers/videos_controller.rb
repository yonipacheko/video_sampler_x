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
    @sampler = Video.where(params[:search_path]).first
  end


end