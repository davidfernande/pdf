class AddColumnMovilToContratos < ActiveRecord::Migration
  def change
    add_column :contratos, :cliente_telefono_movil, :string
  end
end
