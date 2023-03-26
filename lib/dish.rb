class Dish
  attr_reader :dish_number, :dish_name, :price

  def initialize(dish_number, dish_name, price)
    @dish_number = dish_number
    @dish_name = dish_name
    @price = price
  end
end

# dish = Dish.new("Potato curry", 2.1)

# p dish
