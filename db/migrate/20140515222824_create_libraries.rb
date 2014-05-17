class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :url

      t.timestamps
    end
  end
end
