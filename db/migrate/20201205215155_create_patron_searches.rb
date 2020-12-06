class CreatePatronSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :patron_searches do |t|
      t.string :title
      t.string :author
      t.string :isbn

      t.timestamps
    end
  end
end
