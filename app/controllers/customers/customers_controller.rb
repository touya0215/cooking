class Customers::CustomersController < ApplicationController

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to customer_path(@customer[:id])
  end

  def show
    @customer = Customer.new
    @customers = current_customer
    @posts = Post.all
  end

  def edit
    @customer = Customer.new
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to customer_path(params[:id])
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :telephone_number, :email)
  end

end
