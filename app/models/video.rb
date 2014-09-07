class Video < ActiveRecord::Base
  has_many :categories, through: :categorizations
  has_many :categorizations

  def self.search_by_number(number)
    return [] if number.blank?
    where("title LIKE ?", "%#{number}%")

  end

  def self.video_search(params)
    samplers = VideoSearch.new(params)
    samplers.find_the_whole_collection
  end


end