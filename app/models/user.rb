class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 10}
  EMAIL_FORMAT =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true, length: {maximum: 100}, format: {with: EMAIL_FORMAT}
  has_secure_password
  validates :password,length: {minimum: 6}
  validates :introduce, length: {maximum: 200}
  validates :sex, presence: true
  validates :howmuch, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments

  mount_uploader :image, ImageUploader

end
