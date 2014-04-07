class AddHuertoid2ToPrecontratos < ActiveRecord::Migration
  def change
    add_column :precontratos, :huertoid, :text
  end
end
