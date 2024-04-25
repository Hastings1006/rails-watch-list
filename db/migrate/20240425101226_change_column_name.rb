class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :overiew, :overview
  end
end
