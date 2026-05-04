class AddIndustryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :industry, :string
  end
end
