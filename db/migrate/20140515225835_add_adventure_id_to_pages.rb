class AddAdventureIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :adventure_id, :integer
  end
end
