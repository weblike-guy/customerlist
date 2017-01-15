class CustomersController < ApplicationController
 
 def index
   @customers = Customer.all
   @current_mac = CurrentMachine.all
 end

 def show
   @customer = Customer.find(params[:id])
 end

 def new
   @customer = Customer.new
 end

 def create
   @customer = Customer.new(customers_params)
   if @customer.save
     flash.notice = 'Made New customer'
     redirect_to :customers
   else
     render action: 'new'
   end
 end

 def edit
   @customer = Customer.find(params[:id])
 end

 def update
   @customer = Customer.find(params[:id])
   @customer.assign_attributes(customers_params)
   if @customer.save
     flash.notice = 'Update info of customer.'
     redirect_to :customer
   else
     render action: 'edit'
   end
 end

 def destroy
   customer = Customer.find(params[:id])
   customer.destroy!
   flash.notice = 'Erase customer'
   redirect_to :customers
 end

  private

  def customers_params
    params.require(:customer).permit(:name, :deposit,
     current_machines_attributes: [:current_mac, :start_current_mac, :broken])
  end
end
