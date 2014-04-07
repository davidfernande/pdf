class AddContadorToPrecontrato < ActiveRecord::Migration
  def change
    add_column :precontratos, :CosteMensualAlquilerContador, :string
  end
end
