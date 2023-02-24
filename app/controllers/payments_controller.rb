class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @page_name = 'Transactions'
    category = Category.find(params[:category_id])
    @payments = category.payments.order(created_at: :desc)
  end

  def new
    @page_name = 'Add Transaction'
    @payment = Payment.new
    @category = Category.find(params[:category_id])
  end

  def create
    @payment = Payment.new(payment_params.merge(author: current_user))
    @category = Category.find(params['payment'][:category])
    @category_payment = CategoryPayment.new(category: @category, payment: @payment)
    if @payment.save && @category_payment.save
      redirect_to categories_path
      flash[:notice] = 'Payment was successfully added.'
    else
      flash[:alert] = "Couldn't add this payment to this category."
      render :new
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
