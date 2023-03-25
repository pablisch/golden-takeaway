class Dish
  attr_reader :dish_name, :price

  def initialize(dish_name, price)
    @dish_name = dish_name
    @price = price
  end
end

# dish = Dish.new("Potato curry", 2.1)

# p dish