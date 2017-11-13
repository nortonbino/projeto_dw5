class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.float :value
      t.integer :installment
      t.string :name
      t.text :description
      t.references :condominium
      t.date :lastinstallment
      t.date :firstinstallment
      t.timestamps
    end
  end
end
