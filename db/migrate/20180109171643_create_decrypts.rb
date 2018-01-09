class CreateDecrypts < ActiveRecord::Migration[5.1]
  def change
    create_table :decrypts do |t|
      t.text :message
      t.bigint :id_message

      t.timestamps
    end
  end
end
