class AddCondominiumIdToFees < ActiveRecord::Migration[5.1]
  def change
    add_column :fees, :condominium_id, :integer
  end
end
