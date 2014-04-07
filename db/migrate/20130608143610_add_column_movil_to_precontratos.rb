class AddColumnMovilToPrecontratos < ActiveRecord::Migration
  def change
    add_column :precontratos, :cliente_telefono_movil, :string
  end
end
