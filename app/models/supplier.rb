class Supplier < ApplicationRecord

	validates :supplier_id, :supplier_name, presence: true

end
