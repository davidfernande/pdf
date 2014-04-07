class AddColumnNameToContratos < ActiveRecord::Migration
  def change
    add_column :contratos, :apoderado_nombre, :string
    add_column :contratos, :apoderado_apellido1, :string
    add_column :contratos, :apoderado_apellido2, :string
    add_column :contratos, :apoderado_nifniecif, :string
    add_column :contratos, :apoderado_domicilio, :string
    add_column :contratos, :apoderado_provincia, :string
    add_column :contratos, :apoderado_municipio, :string
    add_column :contratos, :apoderado_codigopostal, :string
    add_column :contratos, :apoderado_email, :string
    add_column :contratos, :apoderado_telefono, :string
    add_column :contratos, :apoderado_fax, :string
    add_column :contratos, :justotitulo_nombre, :string
    add_column :contratos, :justotitulo_apellido1, :string
    add_column :contratos, :justotitulo_apellido2, :string
    add_column :contratos, :justotitulo_nifniecif, :string
    add_column :contratos, :justotitulo_domicilio, :string
    add_column :contratos, :justotitulo_provincia, :string
    add_column :contratos, :justotitulo_municipio, :string
    add_column :contratos, :justotitulo_codigopostal, :string
    add_column :contratos, :justotitulo_email, :string
    add_column :contratos, :justotitulo_telefono, :string
    add_column :contratos, :justotitulo_fax, :string
  end
end
