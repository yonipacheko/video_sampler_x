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
    if @sampler
      @samplers = [@sampler] #add the video as the first sample

      # we search first to see if we find a next sampler
      # we reassign the sample variable to the new sample found
      i = 0
      while i <= Video.all.count do
        if ( @sampler = Video.find_next_sampler(@samplers[-1].end_time, @samplers[-1].end_point) )
          @samplers << @sampler
        else
          flash[:error] = 'There is not any more match for this video-sampler'
        end
        i + 1
      end
      return @samplers
    else
      flash[:error] = 'Try again please'
      render :index
    end

  end

  # def find_the_whole_collection(title)
  #   if find_by_title(title)
  #     sample = find_by_title(title)
  #     samplers = [sample] #add the title as the first sample
  #
  #     # we search first to see if we find a next sampler
  #     # we reassign the sample variable to the new sample found
  #     i = 0
  #     while i <= Video.all.count do
  #       if( sample = find_next_sampler(samplers[-1].end_time, samplers[-1].end_point) )
  #         samplers << sample
  #       end
  #       i += 1
  #     end
  #     # at the end return the train and the routes
  #     return samplers
  #   else
  #     #something
  #   end
  # end


end