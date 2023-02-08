User.destroy_all
Todo.destroy_all
Category.destroy_all
CategoryTodo.destroy_all

user1 = User.create!(name: "Nick", email: "email@email.com", password_digest: "password")
user2 = User.create!(name: "Annie", email: "email@email.com", password_digest: "password")
user3 = User.create!(name: "Dallin", email: "email@email.com", password_digest: "password")
user4 = User.create!(name: "Alex", email: "email@email.com", password_digest: "password")

todo1 = Todo.create!(user_id: user1.id, title: "Walk the dog", description: "WALK THE DOG!!!", deadline: "03/12/23", completed: false)
todo2 = Todo.create!(user_id: user2.id, title: "Clean the bathroom", description: "IT'S DIRTY!!!", deadline: "04/12/23", completed: false)
todo3 = Todo.create!(user_id: user3.id, title: "Buy some fishs", description: "FOR THE PET CHANNEL!!!", deadline: "03/12/23", completed: false)
todo4 = Todo.create!(user_id: user4.id, title: "Read Dune", description: "SAND WORMS!!!", deadline: "03/12/24", completed: false)
todo5 = Todo.create!(user_id: user1.id, title: "Go to the grocery store", description: "FOOD!!!", deadline: "01/12/23", completed: true)

category1 = Category.create!(name: "Housework")
category2 = Category.create!(name: "Pet")
category3 = Category.create!(name: "Reading")
category4 = Category.create!(name: "Food")

CategoryTodo.create!(category_id: category1.id, todo_id: todo2.id)
CategoryTodo.create!(category_id: category2.id, todo_id: todo1.id)
CategoryTodo.create!(category_id: category4.id, todo_id: todo3.id)
CategoryTodo.create!(category_id: category3.id, todo_id: todo4.id)
CategoryTodo.create!(category_id: category4.id, todo_id: todo5.id)
CategoryTodo.create!(category_id: category1.id, todo_id: todo1.id)
