class TodoList

	attr_accessor :title, :items


    # Method that create the list
    def initialize(list_title)
    	@title=list_title;
    	@items= Array.new;
    end

    # Creates a new Item and adds it to the array of Items
    def add_item(new_item)
        item = Item.new(new_item)
        @items.push(item)
    end

    # Deletes an Item from the array of Items by sending the description
    def delete_item_by_pos(position)
    	#since array are zero based datastructures we rest 1 to the position
    	position -=1
    	UI.print_delete_message(@items[position].description)
    	@items.delete_at(position);

    end

	# Updates the status of an Item by sending the position of the item in the array
    def update_item_by_pos(position,status)
    	#since array are zero based datastructures we rest 1 to the position
    	position -=1
    	@items[position].update_status(status)
    
    end

    # Deletes an Item from the array of Items by sending the description
    def delete_item_by_description(item_description)

    	@items.each do |item|
	    	if item.item_description_equals?((item_description))
       			UI.print_delete_message(item_description)
     	    	@items.delete(item)

	    	end
	    end
    end

    def rename_list(title_name)
    	@title=title_name
    end

    def print_list 

    	UI.print_line_separator
    	puts @title
    	UI.print_line_separator
    	counter = 1;
    	@items.each do |item|
    		puts counter.to_s + " " + item.description + " completed " + item.completed_status.to_s;
    		counter +=1;
    	end
    	UI.print_line_separator
    	puts "-> End Of #{title}"
    	UI.print_line_separator
    end

    def todo_list_name_equals?(title_name)
	  	if @title.eql?(title_name);
	  		return true;
	  	else
	  		return false;
	  	end
  	end


end

class Item
    # methods and stuff go here
  	attr_accessor :description, :completed_status

    def initialize(item_description)
    	@description=item_description;
    	@completed_status = false
    end

  	
  	def item_description_equals?(description)
	  	if @description.eql?(description);
	  		return true;
	  	else
	  		return false;
	  	end
  	end

  	def update_status(status)

  		@completed_status = status.to_s
  		puts "-> Item status updated"
  	end

end
