class ChangeFormatInHuertos < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE planta ALTER COLUMN potencia TYPE float USING (potencia::float)'
  end

  def down
    execute 'ALTER TABLE planta ALTER COLUMN potencia TYPE string USING (potencia::string)'
  end
end
