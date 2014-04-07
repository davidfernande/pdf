class AddCupsToHuertos < ActiveRecord::Migration
  def change
    add_column :huertos, :cups, :string
  end
end
