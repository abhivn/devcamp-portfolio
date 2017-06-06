class Portfolio < ApplicationRecord
  validates_presence_of :title,:body,:main_image,:thumb_image

  # def self.angular
  #   where(subtitle: "Angular")
  # end

  scope :portfilio_items, -> {where(subtitle: "Ruby on rails")}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://placeimg.com/600/400/any"
    self.thumb_image ||= "https://placeimg.com/300/200/any"
  end
end
