class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :pro_id

      t.timestamps
    end
  end
end
