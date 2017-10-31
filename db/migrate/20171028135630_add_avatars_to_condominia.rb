class AddAvatarsToCondominia < ActiveRecord::Migration[5.1]
  def change
    add_column :condominia, :avatar, :string
  end
end
