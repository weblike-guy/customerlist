class Machine < ApplicationRecord
  belongs_to :customer, inverse_of: :machines
end
