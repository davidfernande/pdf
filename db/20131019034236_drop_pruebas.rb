class DropPruebas < ActiveRecord::Migration
  def up
    drop_table :pruebas
  end

  def down
  end
end
