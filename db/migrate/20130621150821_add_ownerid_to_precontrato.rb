class AddOwneridToPrecontrato < ActiveRecord::Migration
  def change
    add_column :precontratos, :owner_id, :integer
  end
end
