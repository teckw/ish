class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.references :user, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end
