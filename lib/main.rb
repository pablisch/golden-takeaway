require_relative "./dish"
require_relative "./menu"
require_relative "./order"
require_relative "./receipt"
require_relative "./customer_interface"

order_complete = false
menu = Menu.new
order = Order.new
receipt = Receipt.new(order)

dish_1 = Dish.new("Channa Masala", 6.50)
dish_2 = Dish.new("Malai Kofta", 6.0)
dish_3 = Dish.new("Mutter Paneer", 7.3)
dish_4 = Dish.new("Paneer Butter Masala", 7.5)
dish_5 = Dish.new("Dal Makhani", 6.0)
dish_6 = Dish.new("Dal Fry", 6.0)
dish_7 = Dish.new("Aloo Gobi", 6.0)
dish_8 = Dish.new("Methi Mutter Malai", 6.0)
dish_9 = Dish.new("Jeera Aloo", 6.0)
dish_10 = Dish.new("Plain Rice", 3.25)
dish_11 = Dish.new("Kashmiri Pulao Rice", 3.9)
dish_12 = Dish.new("Aloo Parotta", 4.25)
dish_13 = Dish.new("Cobra Lager", 4.1)
dish_14 = Dish.new("Lassi", 3.2)

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

puts "\n\u{1F49B} \u{2B50} Welcome to the wonderful Golden Takeaway \u{2B50} \u{1F49B}\n\n"

until order_complete
  puts ""

  puts "Would you like to see the menu? Y/N\n\n"
  choice = gets.chomp
  if choice.upcase == "Y" or choice.upcase == "YES"
    
    order_complete = true
  elsif choice.upcase == "N" or choice.upcase == "NO"
    puts "\n\nthat's a shame... goodbye.\n\n"
    order_complete = true
  else puts "\nI can only respond to Y or N for this question.\n\n"
  end
end

