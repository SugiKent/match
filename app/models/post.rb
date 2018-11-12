class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :comments

  default_scope ->{order(created_at: :desc)}

  mount_uploader :picture, PictureUploader
end
