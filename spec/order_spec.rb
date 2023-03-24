require "order"

RSpec.describe  do
  context "view the current order" do
    it "returns a list of items on the current order" do
      menu = double :menu
      dish_1 = double :dish        
      dish_2 = double :dish 
      order = Order.new(menu)
      order.add(dish_1, 1)
      order.add(dish_2, 1)
      expect(order.get_order).to eq [{dish_1 => 1}, {dish_2 => 1}]
    end
  end
end