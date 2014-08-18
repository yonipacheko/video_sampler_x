class Video < ActiveRecord::Base
  has_many :categories, through: :categorizations
  has_many :categorizations

  def self.search_by_number(number)
    return [] if number.blank?
    where("title LIKE ?", "%#{number}%")

  end

  def video_search(params)
    VideoSearch.new(params)
  end


end