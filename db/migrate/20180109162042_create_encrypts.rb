class CreateEncrypts < ActiveRecord::Migration[5.1]
  def change
    create_table :encrypts do |t|
      t.text :message
      t.bigint :id_message

      t.timestamps
    end
  end
end
