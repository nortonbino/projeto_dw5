class AddColumnLastInstallmentToFees < ActiveRecord::Migration[5.1]
  def change
    add_column :fees, :lastinstallment, :date
  end
end
