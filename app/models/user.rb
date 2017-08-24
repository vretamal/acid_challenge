# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :image, presence: true

  def validate_image(image)
    if self.image.eql? image
      true
    else
      false
    end
  end


  # Levenshtein method take too long.
  # require 'levenshtein'

  # def validate_image(image)
  #   percent = User.distance_percent(self.image, image)
  #   if percent > 10 || percent == 0
  #     false
  #   else
  #     true
  #   end
  # end

  # def self.distance_percent(first, second)
  #   max_distance = [first, second].max_by(&:length).length
  #   distance = Levenshtein.distance(first, second)
  #   (100.0 / max_distance * distance).round
  # end
end
