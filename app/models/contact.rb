class Contact < ApplicationRecord
  attr_accessor :name, :email, :message

  EMAIL_FORMAT =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {minimum: 2, :too_short =>'名前を入力してください'}
  validates :email, presence: true, length: {maximum: 50, :too_short => 'メールアドレスを入力してください'}, format: {with: EMAIL_FORMAT}
    validates :message, presence: true,  length: {maximum: 1000, too_short => 'お問い合わせ内容を入力してください'}

end
