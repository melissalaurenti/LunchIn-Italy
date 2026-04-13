class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :chat_type
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
