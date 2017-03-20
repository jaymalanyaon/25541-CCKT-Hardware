class Clerk < ApplicationRecord
	validates :clerk_age, :clerk_contact, :clerk_name, :clerk_address, presence: true
	validates :clerk_age, numericality:{only_integers: true}
	validates :clerk_contact, numericality:{only_integers: true}, length:{maximum: 11}
end
