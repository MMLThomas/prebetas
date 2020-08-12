class CreateJoinTableEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
