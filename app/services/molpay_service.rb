class MolpayService

  VERIFY_KEY = 'c6c5cdaabf772a366e1b5ba8a512afac'
  MERCHANT_ID = 'MOLWallet_Dev1'
  COUNTRY = 'MY'
  RETURN_URL = 'http://localhost:3000/payments/success'
  URI = "https://pay.molpay.com/MOLPay/pay/MOLWallet_Dev1/MOLWallet.php?"

  def initialize(amount:, order_id:)
    @amount = amount
    @order_id = order_id
  end

  def build
    uri = URI+"amount=#{@amount}&orderid=#{@order_id}&country=#{COUNTRY}&vcode="+vcode
    uri + "&returnurl=#{RETURN_URL}"
  end

  private

  def vcode
    Digest::MD5.hexdigest(@amount+MERCHANT_ID+@order_id+VERIFY_KEY)
  end

end