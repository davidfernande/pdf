class AddNombreToPlantas < ActiveRecord::Migration
  def change
    add_column :planta, :nombre:string
    add_column :planta, :razonsocial:string
    add_column :planta, :cif:string
    add_column :planta, :cups:string
    add_column :planta, :potencia, :string
    add_column :planta, :produccion, :string
    add_column :planta, :agrupacion_id, :integer
  end
end
