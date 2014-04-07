class CreateHuertos < ActiveRecord::Migration
  def change
    create_table :huertos do |t|
      t.string :name
      t.string :codigonx
      t.string :direccion
      t.string :municipio
      t.string :provincia
      t.string :comunidad
      t.string :codigopostal
      t.decimal :potenciacil
      t.string :productor
      t.string :x
      t.string :y
      t.string :icono
      t.text :descripcion
      t.integer :aniomarcha
      t.string :foto01
      t.string :foto02
      t.string :foto03
      t.decimal :limiteproduccion
      t.decimal :limiteclientes

      t.timestamps
    end
  end
end
