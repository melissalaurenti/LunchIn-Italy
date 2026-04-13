class CreateInsights < ActiveRecord::Migration[7.1]
  def change
    create_table :insights do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :kind
      t.integer :rating
      t.text :content
      t.string :source

      t.timestamps
    end
  end
end
