class Order
  def initialize(menu)
    @menu = menu
    @order = []
  end

  def add(dish, quantity)
    @order << { dish => quantity }
  end

  def get_order
    @order
  end
end