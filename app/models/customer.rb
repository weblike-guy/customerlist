class Customer < ApplicationRecord
  has_one :current_machines, inverse_of: :customer, dependent: :destroy
  has_many :old_machines, inverse_of: :customer, dependent: :destroy

end
