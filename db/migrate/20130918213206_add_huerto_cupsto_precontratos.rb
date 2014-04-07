class AddHuertoCupstoPrecontratos < ActiveRecord::Migration
  def up
    add_column :precontratos, :huerto_cups, :string
  end

  def down
  end
end
