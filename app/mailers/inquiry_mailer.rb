class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
      @inquiry = inquiry
       mail(
         from:'yidongyi8@gmail.com', #送信元アドレス
         to:'yidongyi8@gmail.com', #送信先アドレス
         subject:'お問い合わせ通知' #件名
       )
  end
end
