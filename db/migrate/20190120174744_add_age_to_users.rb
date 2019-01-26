class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :birthday, :date
    add_column :users, :hometown, :string
    add_column :users, :body, :text
    add_column :users, :gender, :integer
    add_column :users, :profile_image_id, :string
  end
end
