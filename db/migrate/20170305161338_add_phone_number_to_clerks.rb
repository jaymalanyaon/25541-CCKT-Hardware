class AddPhoneNumberToClerks < ActiveRecord::Migration[5.0]
  def change
    add_column :clerks, :phone_num, :string
  end
end
