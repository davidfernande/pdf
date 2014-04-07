class AddCamposToPlantas < ActiveRecord::Migration
  def change
    add_column :plantas, :nombre, :string
    add_column :plantas, :razonsocial, :string
    add_column :plantas, :cif, :string
    add_column :plantas, :cups, :string
    add_column :plantas, :potencia, :string
    add_column :plantas, :produccion, :string
    add_column :plantas, :agrupacion_id, :integer    
  end
end
