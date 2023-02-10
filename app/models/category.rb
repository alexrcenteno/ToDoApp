class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :category_todos
  has_many :todos, through: :category_todos
end