class CreateParents < ActiveRecord::Migration[7.1]
  def change
    create_table :parents do |t|
      t.string :city
      t.string :teacher_gender
      t.string :teacher_age
      t.decimal :teacher_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
