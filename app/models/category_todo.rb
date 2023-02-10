class CategoryTodo < ApplicationRecord
  belongs_to :category
  belongs_to :todo

  def add_cat
  end
end
