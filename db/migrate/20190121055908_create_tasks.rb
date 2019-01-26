class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.date :day
      t.string :study_time
      t.text :study_body
      t.integer :user_id

      t.timestamps
    end
  end
end
