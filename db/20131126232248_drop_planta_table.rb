class DropPlantaTable < ActiveRecord::Migration
  def up
    drop_table :planta
    drop_table :plantas
  end

  def down
  end
end
