require_relative "./dish"
require_relative "./menu"

class Order
  def initialize
    @order = []
  end

  def add(dish)
    @order << dish
  end

  def get_order
    @order
  end

  def cancel_order
    @order = []
  end
end
