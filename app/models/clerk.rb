class Clerk < ApplicationRecord
	validates :clerk_age, :phone_num, :clerk_name, :clerk_address, presence: true
	validates :clerk_age, numericality:{only_integers: true}
	validates :phone_num, numericality: true, length:{maximum: 11}
end
