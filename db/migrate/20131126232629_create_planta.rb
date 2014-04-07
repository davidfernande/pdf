class CreatePlanta < ActiveRecord::Migration
  def change
    create_table :planta do |t|
      t.string :nombre
      t.string :razonsocial
      t.string :cif
      t.string :cups
      t.string :potencia
      t.string :produccion
      t.integer :agrupacion_id

      t.timestamps
    end
  end
end
