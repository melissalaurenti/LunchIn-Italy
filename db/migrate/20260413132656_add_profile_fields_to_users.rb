class AddProfileFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job, :string
    add_column :users, :bio, :text
    add_column :users, :avatar_url, :string
    add_column :users, :language, :string
    add_column :users, :role, :string
    add_reference :users, :city, null: false, foreign_key: true
    add_column :users, :birthday, :date
    add_column :users, :linkedin_url, :string
    add_column :users, :company, :string
    add_column :users, :location, :string
  end
end
