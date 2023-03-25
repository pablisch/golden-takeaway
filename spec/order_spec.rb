require "order"

RSpec.describe  do
  context "view the current order" do
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