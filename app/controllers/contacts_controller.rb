class ContactsController < ApplicationController

  def index
    @inquiry = Inquiry.new

  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
      if @inquiry.valid?
        render 'confirm'
      else
        render 'index'
      end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.send_mail(@inquiry).deliver
  end




  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end







end
