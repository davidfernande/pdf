class AddColumnCambioToContratos < ActiveRecord::Migration
  def change
    add_column :contratos, :suministro_cambio, :boolean
  end
end
