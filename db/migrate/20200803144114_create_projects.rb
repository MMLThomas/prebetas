class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :short_description
      t.text :story
      t.text :incentive
      t.string :goal
      t.datetime :start_date
      t.integer :duration
      t.references :user

      t.timestamps
    end
  end
end
