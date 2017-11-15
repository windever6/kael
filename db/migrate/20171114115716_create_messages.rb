class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.bigint :sender_id
      t.string :sender
      t.bigint :receiver_id
      t.string :receiver
      t.text :content

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
