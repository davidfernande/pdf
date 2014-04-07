class AddAgrupacionesToHuertos < ActiveRecord::Migration
  def change
    add_column :huertos, :agrupacion, :string
  end
end
