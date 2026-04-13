class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :status, default: "draft"
      t.references :city, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.integer :capacity, null: false, default: 0
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.boolean :requires_approval, default: false
      t.string :visibility, default: "public"

      t.timestamps
    end
  end
end
