class AddNif2toPrecontratos < ActiveRecord::Migration
  def up
    add_column :precontratos, :banco_nif, :string
  end

  def down
  end
end
