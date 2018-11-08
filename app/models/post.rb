class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :comments

  mount_uploader :picture, PictureUploader
end
