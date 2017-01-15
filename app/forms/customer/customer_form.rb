class Customer::CustomerForm
   include ActiveModel::Model

  attr_accessor :customer
  delegate :persisted? to: :customer

  def initialize(customer = nil)
    @customer = customer
    @customer ||= Customer.new
    @customer.build_current_machine unless @customer.current_machine
    @customer.build_old_machine 
  end
end
