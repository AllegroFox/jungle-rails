class ReceiptMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(user, order)
    @user   = user
    @order  = order
    mail(to: @user.email, subject: 'Your receipt from Jungle: Order number #{order.id}')
  end
end
