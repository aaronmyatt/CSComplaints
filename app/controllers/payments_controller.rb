class PaymentsController < InheritedResources::Base

  def send

  end

  def success

  end

  private

    def payment_params
      params.require(:payment).permit(:amount, :references, :references, :provider)
    end
end

