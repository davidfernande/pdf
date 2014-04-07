class AddColumnApoderadoToPrecontratos < ActiveRecord::Migration
  def change
    add_column :precontratos, :cliente_apoderado, :boolean
    add_column :precontratos, :esprimera_ocupacion, :boolean
  end
end
