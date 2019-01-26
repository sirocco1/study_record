class RemoveStudyFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :study_time, :string
  end
end
