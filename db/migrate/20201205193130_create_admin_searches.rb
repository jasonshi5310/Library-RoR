class CreateAdminSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_searches do |t|
      t.string :title
      t.string :author
      t.string :isbn

      t.timestamps
    end
  end
end
