class Dish
  # attr_reader :dish_name, :price

  def initialize(dish_name, price)
    @dish_name = dish_name
    @price = price
  end

  def price
    @price
  end

  def dish_name
    @dish_name
  end
end

# dish = Dish.new("Potato curry", 2.1)

# p dish
