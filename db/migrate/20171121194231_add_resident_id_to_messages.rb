class AddResidentIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :resident, foreign_key: true
  end
end
