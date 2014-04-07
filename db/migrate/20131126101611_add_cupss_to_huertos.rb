class AddCupssToHuertos < ActiveRecord::Migration
  def change
    add_column :huertos, :cupss, :text
  end
end
