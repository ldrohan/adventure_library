class AddLibraryIdToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :library_id, :integer
  end
end
