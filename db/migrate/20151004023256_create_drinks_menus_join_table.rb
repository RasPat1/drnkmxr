class CreateDrinksMenusJoinTable < ActiveRecord::Migration
  def change
    create_table :drinks_menus, id: false do |t|
      t.integer :drink_id
      t.integer :menu_id
    end

    add_index :drinks_menus, :drink_id
    add_index :drinks_menus, :menu_id
  end
end
