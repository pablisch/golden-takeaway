require_relative "./dish"
require_relative "./menu"
require_relative "./order"
require_relative "./receipt"

class CustomerInterface
  def initialize(name, menu, order, receipt, mobile = 11234123456)
    @name = name
    @mobile = mobile
    @menu = menu
    @order = order
    @receipt = receipt
  end

  def view_menu
    puts "\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\n"
    @menu.get_menu.each { |item| puts "#{item.dish_name} ... £%.2f" % [item.price] }
  end
  
  def view_order
    puts "\n\u{1F374} \u{1F372} Your Golden Takeaway Order \u{1F372} \u{1F374}\n\n"
    @order.get_order.each { |item| puts "1 #{item.dish_name} @ £%.2f" % [item.price] }
  end

  def view_receipt
    puts "\n\u{1F9FE} Your Golden Takeaway Receipt \u{1F9FE}\n\n"
    @receipt.get_receipt.each { |item| puts "1 #{item.dish_name} @ £%.2f" % [item.price] }
    puts "\nTotal = £%.2f" % [@receipt.get_total]
    # puts "#{@receipt.get_total}"
    puts "\n\u{01F64F} Thank you \u{01F64F} \n\n"
  end

  def build_order

  end
end

menu = Menu.new
dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.50))
dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
dish_3 = Dish.new("Plain Rice", ("%.2f"% 3.25))
dish_4 = Dish.new("Cobra Lager", ("%.2f"% 4.1))
menu.add(dish_1)
menu.add(dish_2)
menu.add(dish_3)
menu.add(dish_4)
order = Order.new
order.add(dish_1)
order.add(dish_2)
order.add(dish_1)
order.add(dish_4)
receipt = Receipt.new(order)
customer = CustomerInterface.new("Bob", menu, order, receipt)
customer.view_receipt
