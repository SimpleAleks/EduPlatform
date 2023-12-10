class CreateTeachersParentsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :parents_teachers, id: false do |t|
      t.belongs_to :parent
      t.belongs_to :teacher
    end
  end
end
