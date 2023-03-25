require_relative "./dish"
require_relative "./menu"

class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def add(dish)
    @order << dish
  end

  def get_order
    @order
  end
end

# my_menu = Menu.new
# dish_1 = Dish.new("Aubergine curry", 3.1)
# dish_2 = Dish.new("Spinach curry", 3.2)
# my_menu.add(dish_1)
# my_menu.add(dish_2)
# new_order = Order.new
# new_order.add(dish_1)
# new_order.add(dish_1)


# print "dish 1 = "
# p dish_1
# print "dish 2 = "
# p dish_2
# puts
# print "menu = "
# p my_menu
# puts
# print "order = "
# p new_order