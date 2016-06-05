class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.text :symptom
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
