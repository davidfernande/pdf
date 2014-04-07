class AddNiftoPrecontratos < ActiveRecord::Migration
  def up
    add_column :precontratos, :suministro_potencia, :string
  end

  def down
  end
end
