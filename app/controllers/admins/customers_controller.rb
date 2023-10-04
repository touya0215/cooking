class Admins::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
    @posts = Post.where(customer_id:params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to admins_customer_path(params[:id])
    else
      render :show
    end
  end

  private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :telephone_number, :is_deleted, :email)
  end

end
