class VideoSearch

  attr_accessor :title, :samplers

  def initialize(params)
    @title = params
    @samplers = []

  end

  def find_all_by_title(title)
    if title.blank?
      raise Exception
      return false
    end
    if Video.where(title: title).first.nil?
      return false
    else
      Video.where(title: title).first
    end
  end


  def find_next_sampler(end_time, end_point)
    if Video.where("start_time >= ? AND start_point = ?" , "#{ end_time }", "#{ end_point }" ).first.nil?
      return false
    else
      Video.where("start_time >= ? AND start_point = ?" , "#{ end_time }", "#{ end_point }" ).first
    end
  end

  def find_the_whole_collection(title)

    @sampler = find_all_by_title(title)
    @samplers = [@sampler] #add the video as the first sample
    i = 0
    while i <= Video.all.count do
      if ( @sampler = find_next_sampler(@samplers[-1].end_time, @samplers[-1].end_point) )
        @samplers << @sampler
      end
      i + 1 #  this is an error . I'm interesting to raise, testing this part of the method
    end
      return @samplers
  end


  # @sampler = Video.where(params[:search_path]).first
  # if @sampler
  #   @samplers = [@sampler] #add the video as the first sample
  #
  #   # we search first to see if we find a next sampler
  #   # we reassign the sample variable to the new sample found
  #   i = 0
  #   while i <= Video.all.count do
  #     if ( @sampler = Video.find_next_sampler(@samplers[-1].end_time, @samplers[-1].end_point) )
  #       @samplers << @sampler
  #     else
  #       flash[:error] = 'There is not any more match for this video-sampler'
  #     end
  #     i + 1 #  i += 1
  #
  #   end
  #   return @samplers
  # else
  #   flash[:error] = 'Try again please'
  #   render :index
  # end


  # one thought how can I test if I use wrong sql-semantic, I think dubbled equal (== vs. =) is not used in sql uhn? ?

end