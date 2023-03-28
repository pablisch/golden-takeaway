require_relative "./dish"
require_relative "./menu"
require_relative "./order"
require_relative "./receipt"

class CustomerInterface
  def initialize(menu, order, receipt)
    @menu = menu
    @order = order # Order instance
    @receipt = receipt
  end

  def view_menu
    puts "\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\n"
    show_menu()
  end

  def show_menu
    @menu.get_menu.each { |item| puts "[#{item.dish_number}] #{item.dish_name} ... £%.2f" % [item.price] }
  end
  
  def view_order
    puts "\n\u{1F374} \u{1F372} Your Golden Takeaway Order \u{1F372} \u{1F374}\n\n"
    if @order.get_order.empty?
      puts "No items have been added to this order."
    else
      @order.get_order.each { |item| puts "1 #{item.dish_name} @ £%.2f" % [item.price] }
    end 
  end

  def show_order_array
    @order.get_order
  end

  def view_receipt
    puts "\n\u{1F9FE} Your Golden Takeaway Receipt \u{1F9FE}\n\n"
    @receipt.get_receipt.each { |item| puts "1 #{item.dish_name} @ £%.2f" % [item.price] }
    puts "\nTotal = £%.2f" % [@receipt.get_total]
    puts "\n\u{01F64F} Thank you \u{01F64F} \n\n"
  end

  def build_order(dish_item_number)
    item_match = false
    @menu.get_menu.each do |dish| 
      if dish.dish_number == dish_item_number.to_i
        @order.get_order << dish
        item_match = true
        puts "\n#{dish.dish_name} has been added to your order\n"
      end 
    end
    puts "\nMenu item #{dish_item_number} is not currently available.\n" if item_match == false
  end

  def cancel_order
    @order.cancel_order
  end

  def send_confirmation(mobile)
    message = Message.new(mobile)
    message.send_text
  end
end
