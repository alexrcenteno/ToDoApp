class CreateCategoryTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :category_todos do |t|
      t.integer :category_id
      t.integer :todo_id

      t.timestamps
    end
  end
end
