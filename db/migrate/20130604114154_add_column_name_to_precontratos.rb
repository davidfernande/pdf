class AddColumnNameToPrecontratos < ActiveRecord::Migration
  def change
    add_column :precontratos, :apoderado_nombre, :string
    add_column :precontratos, :apoderado_apellido1, :string
    add_column :precontratos, :apoderado_apellido2, :string
    add_column :precontratos, :apoderado_nifniecif, :string
    add_column :precontratos, :apoderado_domicilio, :string
    add_column :precontratos, :apoderado_provincia, :string
    add_column :precontratos, :apoderado_municipio, :string
    add_column :precontratos, :apoderado_codigopostal, :string
    add_column :precontratos, :apoderado_email, :string
    add_column :precontratos, :apoderado_telefono, :string
    add_column :precontratos, :apoderado_fax, :string
    add_column :precontratos, :justotitulo_nombre, :string
    add_column :precontratos, :justotitulo_apellido1, :string
    add_column :precontratos, :justotitulo_apellido2, :string
    add_column :precontratos, :justotitulo_nifniecif, :string
    add_column :precontratos, :justotitulo_domicilio, :string
    add_column :precontratos, :justotitulo_provincia, :string
    add_column :precontratos, :justotitulo_municipio, :string
    add_column :precontratos, :justotitulo_codigopostal, :string
    add_column :precontratos, :justotitulo_email, :string
    add_column :precontratos, :justotitulo_telefono, :string
    add_column :precontratos, :justotitulo_fax, :string
  end
end
