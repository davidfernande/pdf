class RemovePotencia2FromPrecontratos < ActiveRecord::Migration
  def up
    remove_column :precontratos, :suministro_potencia
  end

  def down
  end
end
