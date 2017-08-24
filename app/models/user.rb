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
end
