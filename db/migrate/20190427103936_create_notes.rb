class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :page
      t.text :quote
      t.text :remark
      t.string :screenshot
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
