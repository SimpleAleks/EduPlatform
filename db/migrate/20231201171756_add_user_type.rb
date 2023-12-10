class AddUserType < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.integer :user_type, null: false
    end
  end
end
