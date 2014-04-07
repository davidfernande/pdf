class AddColumnApoderadoToContratos < ActiveRecord::Migration
  def change
    add_column :contratos, :cliente_apoderado, :boolean
    add_column :contratos, :esprimera_ocupacion, :boolean
  end
end
