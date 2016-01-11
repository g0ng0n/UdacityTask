class TodoList

	attr_reader :title, :items


    def initialize(list_title)
    	@title=list_title;
    	@items= Array.new;
    end

    # Creates a new Item and adds it to the array of Items
    def add_item(new_item)
        item = Item.new(new_item)
        @items.push(item)
    end
end

class Item
    # methods and stuff go here
  	attr_reader :description, :completed_status

    def initialize(item_description)
    	@description=description;
    	@id=id;
    	@completed_status = false
    end


end
