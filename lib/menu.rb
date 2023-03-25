require_relative "./dish"

class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def add(dish)
    @menu << dish
  end

  def get_menu
    fail "Disappoitment is the only thing on the menu today." if @menu.empty?
    @menu
  end
end

# my_menu = Menu.new
# dish_1 = Dish.new("Aubergine curry", 3.1)
# dish_2 = Dish.new("Spinach curry", 3.2)
# my_menu.add(dish_1)
# my_menu.add(dish_2)
# p my_menu.get_menu
