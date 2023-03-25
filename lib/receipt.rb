require_relative "./dish"
require_relative "./menu"
require_relative "./order"

class Receipt
  def initialize(order)
    @receipt = order

  end

  def get_receipt
    @receipt = @receipt.get_order
  end

  def get_total
    total = 0
    @receipt.each { |dish| total += dish.price.to_f }
    # total = @receipt.inject { |total, dish| total += (dish.price.to_f) }
    total
  end
end