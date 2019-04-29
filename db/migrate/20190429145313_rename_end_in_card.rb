class RenameEndInCard < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :end, :finished
  end
end
