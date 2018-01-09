class CreateRsas < ActiveRecord::Migration[5.1]
  def change
    create_table :rsas do |t|
      t.text :n
      t.text :e
      t.text :d

      t.timestamps
    end
  end
end
