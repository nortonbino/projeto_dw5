class CreateCondominiaAndResidents < ActiveRecord::Migration[5.1]
  def change
    create_table :condominia_residents do |t|
    	t.belongs_to :condominium, index: true
    	t.belongs_to :resident, index: true
    end
  end
end
