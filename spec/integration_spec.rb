require "customer_interface"
require "dish"
require "menu"
require "order"
require "receipt"

RSpec.describe  do
  context "view menu" do
    it "returns all items on menu #1" do
      menu = Menu.new
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.50))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.get_menu).to eq [dish_1, dish_2]
    end

    it "returns all items on menu #2" do
      menu = Menu.new
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.50))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      dish_3 = Dish.new("Plain Rice", ("%.2f"% 3.25))
      dish_4 = Dish.new("Cobra Lager", ("%.2f"% 4.1))
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      expect(menu.get_menu).to eq [dish_1, dish_2, dish_3, dish_4]
    end
  end

  context "view the current order" do
    it "returns a list of items on the current order #1" do
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
      expect(order.get_order).to eq [dish_1, dish_2]
    end

    it "returns a list of items on the current order #2" do
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
      expect(order.get_order).to eq [dish_1, dish_2,dish_1, dish_4]
    end
  end

  context "view menu in customer interface" do
    it "returns a list of items on the current order #1" do
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.5))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      customer = CustomerInterface.new("Bob", 54321123456)
      expect { customer.view_menu(menu) }.to output("\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\nChanna Masala ... £6.50\nDal Makhani ... £6.00\n").to_stdout
    end

    it "returns a list of items on the current order #2" do
      menu = Menu.new
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.50))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      dish_3 = Dish.new("Plain Rice", ("%.2f"% 3.25))
      dish_4 = Dish.new("Cobra Lager", ("%.2f"% 4.1))
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      customer = CustomerInterface.new("Bob")
      expect { customer.view_menu(menu) }.to output("\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\nChanna Masala ... £6.50\nDal Makhani ... £6.00\nPlain Rice ... £3.25\nCobra Lager ... £4.10\n").to_stdout
    end
  end

  context "view menu in customer interface" do
    xit "returns a list of items on the current order #1" do
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.5))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      customer = CustomerInterface.new("Bob", 54321123456)
      expect { customer.view_menu(menu) }.to output("\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\nChanna Masala ... £6.50\nDal Makhani ... £6.00\n").to_stdout
    end

    xit "returns a list of items on the current order #2" do
      menu = Menu.new
      dish_1 = Dish.new("Channa Masala", ("%.2f"% 6.50))
      dish_2 = Dish.new("Dal Makhani", ("%.2f"% 6.0))
      dish_3 = Dish.new("Plain Rice", ("%.2f"% 3.25))
      dish_4 = Dish.new("Cobra Lager", ("%.2f"% 4.1))
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      customer = CustomerInterface.new("Bob")
      expect { customer.view_menu(menu) }.to output("\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\nChanna Masala ... £6.50\nDal Makhani ... £6.00\nPlain Rice ... £3.25\nCobra Lager ... £4.10\n").to_stdout
    end
  end
end