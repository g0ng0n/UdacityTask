require_relative 'todolist.rb'
require_relative 'ui.rb'

# this method serves when the user don't want to use the new UI
def no_ui_program

	# Creates a new todo list
	todo = TodoList.new("New Todo List")

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
	todo.rename_list("Gonza TodoList")
	# Print the list
	todo.print_list

	# running the new features
	# adding new items
	todo.add_item("Play Soccer")
	todo.add_item("Watch the Soccer Game")
	todo.add_item("Netflix Time!")

	# Print the list with the new items
	todo.print_list

	# Delete by sending the description
	todo.delete_item_by_description("Study Math")

	# Print the list with the new items
	todo.print_list
end


puts ("Want to see the new UI??? (yes or no)")
action = UI.take_user_input

case action
when "no" 
	no_ui_program
when "yes"
	UI.new
else 
	puts  "Wrong, Please restart the program"
end

