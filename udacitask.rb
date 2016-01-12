require_relative 'todolist.rb'

# Creates a new todo list
todo = TodoList.new("TodoList")

# Add four new items
todo.add_item("Play Piano")
todo.add_item("Study Math")
todo.add_item("Run a Mile")
todo.add_item("Go to the Market")

# Print the list
todo.print_list
# Delete the first item
todo.delete_item_by_pos(1)

# Print the list
todo.print_list

# Delete the second item
todo.delete_item_by_pos(2)

# Print the list
todo.print_list

# Update the completion status of the first item to complete
todo.update_item_by_pos(0,true)
# Print the list
todo.print_list

# Update the title of the list
todo.rename_list("Gonzo TodoList")
# Print the list
todo.print_list


