class Customers::CustomersController < ApplicationController

  before_action :set_customer, only: [:likes]

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to customer_path(@customer[:id])
  end

  def show
    @customer = Customer.new
    @customers = current_customer
    @posts = Post.where(customer_id:params[:id])
  end

  def likes
    @likes = Like.where(customer_id: @customer.id).pluck(:post_id)
    @like_posts = Post.find(@likes)
  end
  
  def ranks
    @post_like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
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

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
