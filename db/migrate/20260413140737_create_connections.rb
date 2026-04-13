class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.string :status
      t.string :source
      t.text :note
      t.references :user, null: false, foreign_key: true
      t.references :connectede_user, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
