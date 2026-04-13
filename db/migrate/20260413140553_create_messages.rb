class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.string :message_type
      t.string :attachment_url
      t.datetime :read_at

      t.timestamps
    end
  end
end
