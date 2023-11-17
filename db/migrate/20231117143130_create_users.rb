class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name, :limit => 100
      t.string :last_name, :limit => 100

      t.timestamps
    end
  end
end
