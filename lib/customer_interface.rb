require_relative "./dish"
require_relative "./menu"
require_relative "./order"

class CustomerInterface
  def initialize(name, mobile = 11234123456)
    @name = name
    @mobile = mobile
  end

  def view_menu(menu) # menu is an instance of Menu
    puts "\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\n"
    menu.get_menu.each do |item|
      puts "#{item.dish_name} ... £#{item.price}"
    end
  end
  
  def view_order(order) # order is an instance of Order

  end

  def view_receipt(receipt) # receipt is an instance of Receipt

  end

  def build_order(order) # order is an instance of Order

  end
end

menu = Menu.new
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.50))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      dish_3 = Dish.new("Plain Rice", ("%.2f"% 3.25))
      dish_4 = Dish.new("Cobra Lager", ("%.2f"% 4.1))
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      customer = CustomerInterface.new("Bob")
      customer.view_menu(menu)