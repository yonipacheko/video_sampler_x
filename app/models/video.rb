class Video < ActiveRecord::Base
  has_many :categories, through: :categorizations
  has_many :categorizations


 def self.search_by_number(number)
   return [] if number.blank?
   where("title LIKE ?", "%#{number}%")

 end


 def self.find_by_title(title)
   return [] if title.blank?
   where(title: title).first
 end


 def self.find_next_sampler(end_time, end_point)

   # how can I test if I write wrong sql association (== vs. =)
   where("start_time >= ? AND start_point = ?" , "#{ end_time }", "#{ end_point }" ).first
 end



end