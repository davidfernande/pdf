class AddColumnCambioToPrecontratos < ActiveRecord::Migration
  def change
    add_column :precontratos, :suministro_cambio, :boolean
  end
end
