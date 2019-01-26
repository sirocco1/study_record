class AddStudyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :study_item, :string
  end
end
