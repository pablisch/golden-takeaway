require_relative "./dish"
require_relative "./menu"
require_relative "./order"
require_relative "./receipt"
require_relative "./customer_interface"

$order_complete = false
$order_in_progress = false
leave = false
menu = Menu.new
order = Order.new
receipt = Receipt.new(order)
customer = CustomerInterface.new(menu, order, receipt)

dish_1 = Dish.new(11, "Channa Masala", 6.50)
dish_2 = Dish.new(12, "Dal Makhani", 6.0)
dish_3 = Dish.new(13, "Mutter Paneer", 7.3)
dish_4 = Dish.new(14, "Paneer Butter Masala", 7.5)
dish_5 = Dish.new(15, "Malai Kofta", 7.0)
dish_6 = Dish.new(16, "Dal Fry", 5.9)
dish_7 = Dish.new(17, "Aloo Gobi", 6.65)
dish_8 = Dish.new(18, "Methi Mutter Malai", 6.35)
dish_9 = Dish.new(19, "Jeera Aloo", 3.8)
dish_10 = Dish.new(21, "Plain Rice", 3.25)
dish_11 = Dish.new(22, "Kashmiri Pulao Rice", 3.9)
dish_12 = Dish.new(31, "Aloo Parotta", 4.25)
dish_13 = Dish.new(41, "Cobra Lager", 4.1)
dish_14 = Dish.new(42, "Lassi", 3.2)

menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
menu.add(dish_4)
menu.add(dish_5)
menu.add(dish_6)
menu.add(dish_7)
menu.add(dish_8)
menu.add(dish_9)
menu.add(dish_10)
menu.add(dish_11)
menu.add(dish_12)
menu.add(dish_13)
menu.add(dish_14)

puts "\n\u{1F49B} Welcome to the wonderful Golden Takeaway \u{1F49B}\n"

def line(plus = false)
  puts if plus == true
  puts "------------------------".center(35)
end

def main_menu
  puts "\n\u{1F518} MAIN MENU"
  puts "Choose from the following options:"
  puts "    [1] View menu"
  puts "    [2] Start order" if $order_in_progress == false
  puts "    [2] Continue with order" if $order_in_progress == true
  puts "    [3] View order" if $order_in_progress == true
  puts "    [4] View receipt" if $order_complete == true
  puts "    [9] Leave"
  puts
  gets.chomp
end

def main_menu_handler(customer, choice)
  line()
  if choice == "1" # view menu
    customer.view_menu
    line()
  elsif choice == "2" # start/continue order
    order_menu(customer)
    line()
  elsif choice == "3" and $order_in_progress == true # view order
    customer.view_order
    line(true)
  elsif choice == "4" and $order_complete == true # view receipt
    customer.view_receipt
    line()
  elsif choice == "9" # exit
    exit
  else 
    puts "\nPlease enter one of the options below.\n"
  end
end

def order_menu(customer) # an instance of CustomerInterface
  $order_in_progress = true
  puts "\n\u{1F9FE} ORDER MENU\n\n"
  customer.show_menu
  puts "\nChoose from the following options:"
  puts "    [1] Add dish to order"
  puts "    [2] View order" 
  puts "    [3] Complete order" 
  puts "    [4] Cancel order" 
  puts "    [5] Return to Main menu options" 
  puts "Or enter dish number to add directly to your order."
  puts
  order_menu_handler(customer, gets.chomp)
end

def order_menu_handler(customer, choice)
  line()
  if choice == "1" # add item to order
    add_menu(customer)
  elsif choice == "2" # view order
    customer.view_order
    line(true)
    order_menu(customer)
  elsif choice == "3" # complete order
    $order_complete = true
    puts "--- complete order --- work in progress!"
  elsif choice == "4" # cancel order
    customer.cancel_order
    puts "\nYour current order has been cancelled."
    order_menu(customer)
  elsif choice == "5" # return to main menu
    puts "Returning to main menu options.\n"
  elsif choice == "9" # exit
    exit
  elsif choice.to_i > 9 # directly to add to menu
    customer.build_order(choice)
    line()
    order_menu(customer)
  else 
    puts "\nPlease enter one of the options below.\n"
    order_menu(customer)
  end
end

def add_menu(customer)
  puts "\n\u{1F372} ADD DISH TO ORDER\n\n"
  customer.show_menu
  puts "\nEnter the dish number to add it to your order"
  puts "    or enter [9] to return to the Order menu.\n\n"
  add_choice = gets.chomp
  customer.build_order(add_choice) unless add_choice == "9"
  order_menu(customer)
end

def add_menu_handler

end

loop do
  main_menu_choice = main_menu()
  main_menu_handler(customer, main_menu_choice)
end



