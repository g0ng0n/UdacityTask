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
    	@items.delete_at(position);
    end

    # Deletes an Item from the array of Items by sending the description
    def delete_item_by_description(item_description)

    	@items.each do |item|
	    	if item.item_description_equals?(item_description)
    	    	@items.delete(item)
       			puts "item deleted"
	    	end
	    end
    end

    def rename_list(name)
    	@title=name
    end


    def print_list 

    	puts "-------------"
    	puts @title
    	puts "-------------"
    	counter = 0;
    	@items.each do |item|
    		puts counter.to_s + " " + item.description + " completed " + item.completed_status.to_s;
    		counter +=1;
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
	  	end
  	end

  	def update_status(status)
  		@status = status
  	end

end
