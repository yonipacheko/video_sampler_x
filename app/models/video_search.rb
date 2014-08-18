class VideoSearch

  attr_accessor :title

  def initialize(params)
    @title = params

  end

  def self.find_by_title(title)
    return [] if title.blank?
    Video.where(title: title).first
  end


  def self.find_next_sampler(end_time, end_point)
    # one thought how can I test if I use wrong sql-semantic, I think dubbled equal (== vs. =) is not used in sql uhn? ?
    Video.where("start_time >= ? AND start_point = ?" , "#{ end_time }", "#{ end_point }" ).first
  end

  def find_the_whole_collection(title)

    if find_by_title(title)
      sample = find_by_title(title)
      samplers = [sample] #add the title as the first sample

      # we search first to see if we find a next sampler
      # we reassign the sample variable to the new sample found
      i = 0
      while i <= Video.all.count do
        if( sample = find_next_sampler(samplers[-1].end_time, samplers[-1].end_point) )
          samplers << sample
        end
        i += 1
      end
      # at the end it returns the whole video with its samplers
      return samplers
    else
      #something
    end
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

end