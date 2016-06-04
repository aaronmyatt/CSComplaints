require 'spec_helper'
require 'rails_helper'


describe MolpayService do
  Given(:subject) { MolpayService }
  Given(:subject_w_validparams) { subject.new(amount: '1.10', order_id: '123') }
  context '#init' do
    context 'throws error if not arguments are given' do
      When(:result) { subject.new }
      Then{ result == Failure(ArgumentError)}
    end
  end

  context 'build' do
    When(:result) { subject_w_validparams.build }

    context 'returns a string' do
      Then{ result.class == String }
    end

    context 'returns a valid url' do
      Then{ %r{(http|https):\/\/} === result }
      And { result.include? 'https://pay.molpay.com/MOLPay/pay/MOLWallet_Dev1/MOLWallet.php?amount=' }
    end

    context 'url contains params passed in' do
      Then{ result.include? 'amount=1.10' }
      And { result.include? 'orderid=123' }
    end

    context 'url contains default country code' do
      Then{ result.include? 'country=MY' }
    end

    context 'url contains vcode' do
      Then{ result.include? 'vcode=' + vcode }
    end

    context 'url contains redirect url' do
      Then{ result.include? 'returnurl=http://localhost:3000/payments/success'}
    end

    def vcode
      verifykey = 'c6c5cdaabf772a366e1b5ba8a512afac'
      mid = 'MOLWallet_Dev1'
      Digest::MD5.hexdigest('1.10'+mid+'123'+verifykey)
    end
  end
end