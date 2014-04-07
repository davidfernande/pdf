class RemoveNameFromHuertos < ActiveRecord::Migration
  def up
    remove_column :huertos, :name
    remove_column :huertos, :codigonx
    remove_column :huertos, :direccion
    remove_column :huertos, :codigopostal
    remove_column :huertos, :potenciacil
    remove_column :huertos, :productor
    remove_column :huertos, :icono
    remove_column :huertos, :aniomarcha
    remove_column :huertos, :limiteproduccion
    remove_column :huertos, :limiteclientes
    remove_column :huertos, :cups
    remove_column :huertos, :cupss
  end

  def down
  end
end
