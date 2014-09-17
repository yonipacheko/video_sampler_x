require 'date'
require 'nokogiri'
require 'open-uri'

class DownloadingData

  attr_accessor :today

  def initialize
    @today = Date.today
  end

  def interval_data(point_a, point_b) # -2, +2 # the end user is gonna get a list of choices (dropdown with different choices)
    start_point = @today - point_a
    end_point  = @today + point_b
    (start_point..end_point).each do |week_day|
      #calling the API-method
      fetching_data(week_day.year, week_day.mon, week_day.mday)
      puts week_day #checking the week day
    end
  end


  def fetching_data(year, month, day)
    @train_at_path_locations
    doc = Nokogiri::XML(open("http://freytag.se/utin2013/utin_getxml.php?year=#{year}&month=#{month}&day=#{day}"))
    @train_tables = doc.css("TrainTimeTable")

  #end
     @train_tables.each do |i|
    #
       @train_id = i.css('TrainIdent PathIdent').text
    #   @train_locations = i.css('TrainAtPathLocation')
    #   @departure_time =   i.css('TrainAtPathLocation DepartureTimeAtLocation').first.text
    #   @first_train_location = i.css('TrainAtPathLocation LocationIdent LocationSubsidiaryCode').first.text
    #
    #
    #   if i.at_css('TrainPathNotAvailable')
    #     @end_location = i.css('ToLocationIdent LocationSubsidiaryCode').text
    #     @train_locations.each do |j|
    #       if j.at_css('LocationIdent LocationSubsidiaryCode').text == @end_location
    #         if j.at_css('DepartureTimeAtLocation')
    #           @arrival_time = j.css('DepartureTimeAtLocation').text
    #         else
    #           @arrival_time = j.css('ArrivalTimeAtLocation').text
    #         end
    #       end
    #     end
    #     @last_train_location  = @end_location
    #   else
    #     @end_location = i.css('TrainAtPathLocation LocationIdent LocationSubsidiaryCode').last.text
    #     @last_train_location = @end_location
    #     @arrival_time = i.css('TrainAtPathLocation ArrivalTimeAtLocation').last.text
    #   end
    #
       Video.create(
           title: @train_id
    #       start_location: @first_train_location,
    #       departure_time: @departure_time,
    #       final_location: @last_train_location,
    #       arrival_time: @arrival_time
       )
    #
     end

  end

end