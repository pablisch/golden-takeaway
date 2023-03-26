require "customer_interface"
require "dish"
require "menu"
require "order"
require "receipt"
require "customer"

RSpec.describe "takeaway integration" do
  context "view menu" do
    it "returns all items on menu #1" do
      menu = Menu.new
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.get_menu).to eq [dish_1, dish_2]
    end

    it "returns all items on menu #2" do
      menu = Menu.new
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      dish_3 = Dish.new(21, "Plain Rice", 3.25)
      dish_4 = Dish.new(41, "Cobra Lager", 4.1)
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
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      dish_3 = Dish.new(21, "Plain Rice", 3.25)
      dish_4 = Dish.new(41, "Cobra Lager", 4.1)
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
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      dish_3 = Dish.new(21, "Plain Rice", 3.25)
      dish_4 = Dish.new(41, "Cobra Lager", 4.1)
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

  context "output menu in customer interface" do
    it "outputs menu to customer #1" do
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      order = Order.new
      receipt = Receipt.new(order)
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_menu }.to output("\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\n[11] Channa Masala ... £6.50\n[12] Dal Makhani ... £6.00\n").to_stdout
    end

    it "outputs menu to customer #2" do
      menu = Menu.new
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      dish_3 = Dish.new(21, "Plain Rice", 3.25)
      dish_4 = Dish.new(41, "Cobra Lager", 4.1)
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      order = Order.new
      receipt = Receipt.new(order)
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_menu }.to output("\n\u{1F49B} \u{2B50} Golden Takeaway Menu \u{2B50} \u{1F49B}\n\n[11] Channa Masala ... £6.50\n[12] Dal Makhani ... £6.00\n[21] Plain Rice ... £3.25\n[41] Cobra Lager ... £4.10\n").to_stdout
    end
  end

  context "output order in customer interface" do
    it "outputs message to user when no items have been ordered" do
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      order = Order.new
      receipt = Receipt.new(order)
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_order }.to output("\n\u{1F374} \u{1F372} Your Golden Takeaway Order \u{1F372} \u{1F374}\n\nNo items have been added to this order.\n").to_stdout
    end

    it "outputs order to customer #1" do
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      order = Order.new
      order.add(dish_1)
      order.add(dish_1)
      receipt = Receipt.new(order)
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_order }.to output("\n\u{1F374} \u{1F372} Your Golden Takeaway Order \u{1F372} \u{1F374}\n\n1 Channa Masala @ £6.50\n1 Channa Masala @ £6.50\n").to_stdout
    end

    it "outputs order to customer #2" do
      menu = Menu.new
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      dish_3 = Dish.new(21, "Plain Rice", 3.25)
      dish_4 = Dish.new(41, "Cobra Lager", 4.1)
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
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_order }.to output("\n\u{1F374} \u{1F372} Your Golden Takeaway Order \u{1F372} \u{1F374}\n\n1 Channa Masala @ £6.50\n1 Dal Makhani @ £6.00\n1 Channa Masala @ £6.50\n1 Cobra Lager @ £4.10\n").to_stdout
    end
  end

  context "output receipt in customer interface" do
    it "outputs receipt to customer #1" do
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      menu = Menu.new
      menu.add(dish_1)
      menu.add(dish_2)
      order = Order.new
      order.add(dish_1)
      order.add(dish_1)
      receipt = Receipt.new(order)
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_receipt }.to output("\n\u{1F9FE} Your Golden Takeaway Receipt \u{1F9FE}\n\n1 Channa Masala @ £6.50\n1 Channa Masala @ £6.50\n\nTotal = £13.00\n\n\u{01F64F} Thank you \u{01F64F} \n\n").to_stdout
    end

    it "outputs receipt to customer #2" do
      menu = Menu.new
      dish_1 = Dish.new(11, "Channa Masala", 6.50)
      dish_2 = Dish.new(12, "Dal Makhani", 6.0)
      dish_3 = Dish.new(21, "Plain Rice", 3.25)
      dish_4 = Dish.new(41, "Cobra Lager", 4.1)
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
      customer = CustomerInterface.new(menu, order, receipt)
      expect { customer.view_receipt }.to output("\n\u{1F9FE} Your Golden Takeaway Receipt \u{1F9FE}\n\n1 Channa Masala @ £6.50\n1 Dal Makhani @ £6.00\n1 Channa Masala @ £6.50\n1 Cobra Lager @ £4.10\n\nTotal = £23.10\n\n\u{01F64F} Thank you \u{01F64F} \n\n").to_stdout
    end
  end
end