class CreateCondominia < ActiveRecord::Migration[5.1]
  def change
    create_table :condominia do |t|
      t.string :name
      t.integer :number_proprieties
      t.text :address
      t.references :user

      t.timestamps
    end
  end
end
