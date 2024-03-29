require "order"

RSpec.describe Order do
  context "view the current order" do
    it "outputs message to user when no items have been ordered" do
      dish_1 = double :dish        
      dish_2 = double :dish 
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      order = Order.new
      receipt = Receipt.new(order)
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_order }.to output("\n\u{1F374} \u{1F372} Your Golden Takeaway Order \u{1F372} \u{1F374}\n\nNo items have been added to this order.\n").to_stdout
    end

    it "returns a list of items on the current order #1" do
      menu = double :menu
      dish_1 = double :dish        
      dish_2 = double :dish 
      order = Order.new
      order.add(dish_1)
      order.add(dish_2)
      expect(order.get_order).to eq [dish_1, dish_2]
    end

    it "returns a list of items on the current order #2" do
      menu = Menu.new
      dish_1 = double :dish        
      dish_2 = double :dish 
      dish_3 = double :dish 
      dish_4 = double :dish 
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      order = Order.new
      order.add(dish_1)
      order.add(dish_2)
      order.add(dish_1)
      order.add(dish_4)
      expect(order.get_order).to eq [dish_1, dish_2,dish_1, dish_4]
    end
  end
end