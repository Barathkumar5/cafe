class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.int :price
      t.text :description
      t.string :name2
      t.timestamps
    end

  end
end
