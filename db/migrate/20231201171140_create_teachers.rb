class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :gender
      t.date :birthday
      t.string :city
      t.decimal :rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
