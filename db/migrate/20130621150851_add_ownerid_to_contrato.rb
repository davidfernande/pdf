class AddOwneridToContrato < ActiveRecord::Migration
  def change
    add_column :contratos, :owner_id, :integer
  end
end
