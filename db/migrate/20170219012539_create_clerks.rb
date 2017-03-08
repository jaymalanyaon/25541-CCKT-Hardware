class CreateClerks < ActiveRecord::Migration[5.0]
  def change
    create_table :clerks do |t|
      t.integer :clekr_id
      t.string :clerk_name
      t.integer :clerk_age
      t.text :clerk_address
      t.integer :clerk_contact

      t.timestamps
    end
  end
end
