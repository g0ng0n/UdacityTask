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
		puts"|3) Print Items of a Selected List by Position			|"
		puts"|4) Print All the Lists    					|"
		puts"|5) Exit                   					|"
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
	      @exit=true
	    end
    end

    def new_list
    	sleep(1)
    	system("clear")
    	puts "1) New List   "
    	name= UI.select_name
    	todo = TodoList.new(name)
    	@todoLists.push(todo)
    	puts "-> Todo List #{name} Created"
    end

    def rename_todo_list
    	sleep(1)
    	system("clear")
    	puts "2) Update Name of List "
		puts "please select the name of the list you want to rename"
    	old_name= UI.select_name

    	puts "please select the new name"
    	new_name= UI.select_name
    	
    	todo = get_todo_list_from_array(old_name)
    	puts todo.title
    	todo.rename_list(new_name)

    	puts "-> Todo List #{new_name} renamed"
    end


    def print_todo_list_by_position
    	sleep(1)
    	system("clear")
    	puts "3) Print Selected List by Position"
		puts "please select the position of the list you want to print"
		puts "if you want to check all the list, select option 4 in the Principal Menu"
    	position= UI.take_user_input


    	todo = @todoLists[position.to_i-1]
    	todo.print_list

    end


    def get_todo_list_from_array(name)
    	found = false;
    	@todoLists.each do |todo|

	    	if todo.todo_list_name_equals?(name)
	    		found =true
	    		return todo
	    	end

	    end

	    if found == false
	    	puts "-> Todo List Not Found"
	    	return nil
	    end

    end


    def print_todo_lists 

		sleep(1)
    	system("clear")
    	puts "4) New List   "
    	counter = 1;
    	@todoLists.each do |list|
    		puts counter.to_s + " " + list.title
    		counter +=1;
    	end
    	puts "-> End Of Lists"
    end

   


end