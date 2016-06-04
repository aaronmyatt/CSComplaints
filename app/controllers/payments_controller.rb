class PaymentsController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token, only: :success
  before_action :molpay_params, only: :success
  before_action :set_user, only: :create
  before_action :set_complaint, only: :create
  before_action :set_payment, only: :create
  before_action :authenticate_user!

  def create
    @payment.save
    redirect_to MolpayService.from_payment_model(@payment).build
  end

  def success
    @payment.status = params[:status]
    @payment.save
    redirect_to @payment
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :user_id, :complaint_id)
  end

  def molpay_params
    @payment = Payment.find(params[:orderid])
  end

  def set_complaint
    @complaint = Complaint.find(payment_params[:complaint_id])
  end

  def set_user
    @user = User.find(payment_params[:user_id])
  end

  def set_payment
    @payment = Payment.new(payment_params)
  end

end

