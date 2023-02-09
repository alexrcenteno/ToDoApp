class Todo < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :category_todos
  has_many :categories, through: :category_todos
end
