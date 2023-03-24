require "confirmation"
require "dish"
require "menu"
require "order"
require "receipt"

RSpec.describe  do
  context "view menu" do
    it "returns all items on menu" do
      menu = Menu.new
      dish_1 = Dish.new(1, "Channa Masala", 6.5)
      dish_2 = Dish.new(2, "Dal Makhani", 6)
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.get_menu).to eq [dish_1, dish_2]
    end

    it "returns all items on menu" do
      menu = Menu.new
      dish_1 = Dish.new(1, "Channa Masala", 6.5)
      dish_2 = Dish.new(2, "Dal Makhani", 6)
      dish_3 = Dish.new(3, "Plain Rice", 3.25)
      dish_4 = Dish.new(4, "Cobra Lager", 4.1)
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      expect(menu.get_menu).to eq [dish_1, dish_2, dish_3, dish_4]
    end
  end

  context "view the current order" do
    it "returns a list of items on the current order" do
      menu = Menu.new
      dish_1 = Dish.new(1, "Channa Masala", 6.5)
      dish_2 = Dish.new(2, "Dal Makhani", 6)
      dish_3 = Dish.new(3, "Plain Rice", 3.25)
      dish_4 = Dish.new(4, "Cobra Lager", 4.1)
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      order = Order.new(menu)
      order.add(dish_1, 1)
      order.add(dish_2, 1)
      expect(order.get_order).to eq [{dish_1 => 1}, {dish_2 => 1}]
    end
  end
end