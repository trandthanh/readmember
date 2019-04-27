class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :category
      t.string :title
      t.string :author
      t.string :publication
      t.date :begin
      t.date :end
      t.text :description
      t.integer :rating
      t.string :cover
      t.string :url
      t.string :publisher

      t.timestamps
    end
  end
end
