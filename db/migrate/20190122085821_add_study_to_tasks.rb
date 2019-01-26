class AddStudyToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :study_time, :decimal
  end
end
