class AddCamposToPrecontratos < ActiveRecord::Migration
  def change
    add_column :precontratos, :finalizado, :boolean
    add_column :precontratos, :enviado, :boolean
  end
end
