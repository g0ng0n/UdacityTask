class UI

	def initialize
		@exit=false
		#this is the array that is going to be storing the to-do list created
		@todoLists=Array.new
		generate_dummy_data()
	    start_ui
	end

	def generate_dummy_data()

		# Creates a new todo list
		todo = TodoList.new("Dummy1")

		# Add four new items
		todo.add_item("Play Piano")
		todo.add_item("Study Math")
		todo.add_item("Run a Mile")
		todo.add_item("Go to the Market")

		@todoLists.push(todo)		
		todo = TodoList.new("Dummy2")

		# Add four new items
		todo.add_item("Play Piano")
		todo.add_item("Study Math")
		todo.add_item("Run a Mile")
		todo.add_item("Go to the Market")

		@todoLists.push(todo)		
	end
	#method that starts the UI.
	def start_ui
	    while @exit==false
	      show_options
	      action = UI.take_user_input
	      take_action(action)
	    end
	    system("clear")
	    puts "-> End of Program"
	end

	def self.take_user_input
	    puts "-> Please Choose an Option "
	    print "> "
	  	gets.chomp.to_s
	end

	def self.select_name
		puts "-> Plase choose a name "
		print "> "
		gets.chomp.to_s

	end



	def self.print_line_separator
	    puts '-' * 20
	end

	def self.print_delete_message(item_description)
		puts "-> Item " + item_description + " Deleted"
	end

	private
	def show_options
		puts" -----------Principal Menu------------------------------"
		puts"|1) New List               					|"
		puts"|2) Update Name of List    					|"
		puts"|3) Print a Selected List by Position			|"
		puts"|4) Print All the Lists    					|"
		puts"|5) Create New Item on A List    				|"
		puts"|6) Update an Item by Description     				|"
		puts"|7) Delete Item by Description    				|"
		puts"|8) Print All the Items    					|"
		puts"|0) Exit                   					|"
		puts" -------------------------------------------------------"

	end
	
	def take_action(action)
		
		case action
	    when "1"
	      new_list
	    when "2"
	      rename_todo_list
	    when "3"
	      print_todo_list_by_position
	    when "4"
	      print_todo_lists
	  	when "5"
	      create_new_item
	    when "6"
	      update_item_by_description
	    when "7"
	      delete_item_by_description
	    when "8"
	      print_items
	    when "0"
	      @exit=true
	    end
    end

    def new_list

		welcome_message("1) New List ")
    	name= user_input_message("please select the name of the new list")

    	todo = TodoList.new(name)
    	@todoLists.push(todo)
    	puts "-> Todo List #{name} Created"
    end

    def rename_todo_list
    	
		welcome_message("2) Update Name of List ")

    	old_name= user_input_message("please select the name of the list you want to rename")

    	new_name= user_input_message("please select the new name")
    	
    	todo = get_todo_list_from_array(old_name)
    	if todo == nil
    		puts "-> Todo List Not Found"
    	else
	    	todo.rename_list(new_name)
	    	puts "-> Todo List #{new_name} renamed"
	    end
    	
    end


    def print_todo_list_by_position
    	
		welcome_message("3) Print Selected List by Position")
		list_message("please select the position of the list you want to print")
    	position= UI.take_user_input

    	todo = @todoLists[position.to_i-1]
    	if todo == nil
    		puts "-> Todo List Not Found"
    	else
    		todo.print_list
    	end

    end


    def print_todo_lists 

		welcome_message("4) Print all Lists ")
    	counter = 1;
    	@todoLists.each do |list|
    		puts counter.to_s + " " + list.title
    		counter +=1;
    	end
    	puts "-> End Of Lists"
    end

    def create_new_item
    	welcome_message("5) Create New Item on A List  ")
    	
		list_message("please select the name of the list you want to add the new item")
		position= user_input_message("Choose the position")

		todo = @todoLists[position.to_i-1]
		puts "-> Please insert the description of the new item of the List"

    	item = user_input_message("Write the description")

    	todo.add_item(item)
    	puts "-> item #{item} was added into the list #{todo.title}"
    end

    def update_item_by_description

		welcome_message("6) Update an Item by Description ")

		list_message("please select the name of the list you want to update the item")
		list_name = UI.take_user_input
		todo = get_todo_list_from_array(list_name)
	
		if todo == nil

    		puts "-> Todo List Not Found"
    	else
    		old_description =	user_input_message("Please insert the Description of item of the List you want to update")
     		new_description =	user_input_message("Please insert the NEW Description of item of the List you want to update")

    		todo.update_item_by_description(new_description,old_description)
    		puts "-> Item #{new_description} from Todo List #{list_name} UPDATED"

		end
    end


    def delete_item_by_description

		welcome_message("7) Delete Item by Description ")

		list_message("please select the name of the list you want to delete the item")
		list_name = UI.take_user_input

		new_description =	user_input_message("Please inser the New Description of item of the List you want to delete")

		todo = get_todo_list_from_array(list_name)
		if todo == nil
    		puts "-> Todo List Not Found"
    	else
    		todo.delete_item_by_description(new_description)
    	    puts "-> Item #{new_description} from Todo List #{list_name} Deleted"

    	end
		
    end

    def print_items
    	welcome_message("8) Print All the Items ")

		list_message("please select the name of the list you want to delete the item")
		list_name = UI.take_user_input

		todo = get_todo_list_from_array(list_name)
		if todo == nil
    		puts "-> Todo List Not Found"
    	else
	   	    puts "-> Items For #{todo.title}"
	   	    todo.print_list

    	end



    end

   
    private
    def get_todo_list_from_array(name)
    	found = false;
    	@todoLists.each do |todo|

	    	if todo.todo_list_name_equals?(name)
	    		found =true
	    		return todo
	    	end

	    end

	    if found == false
	    	
	    	return nil
	    end

    end

    def list_message(message)
    	puts message
		puts "if you want to check all the list, select option 4 in the Principal Menu"
	end

	def welcome_message(message)
		sleep(1)
    	system("clear")
    	puts message
	end
	def user_input_message(message)
		puts message
		user_input = UI.take_user_input
		return user_input.to_s
	end

end