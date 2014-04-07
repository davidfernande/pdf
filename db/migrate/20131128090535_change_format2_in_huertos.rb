class ChangeFormat2InHuertos < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE planta ALTER COLUMN produccion TYPE float USING (produccion::float)'
  end

  def down
    execute 'ALTER TABLE planta ALTER COLUMN produccion TYPE string USING (produccion::string)'
  end
end
