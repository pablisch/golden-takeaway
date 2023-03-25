require "menu"

RSpec.describe  do
  context "view menu" do
    it "fails with no items on menu" do
      menu = Menu.new
      expect { menu.get_menu }.to raise_error "Disappoitment is the only thing on the menu today."
    end

    it "returns all items on menu #1" do
      menu = Menu.new
      dish_1 = double :dish        
      dish_2 = double :dish     
      menu.add(dish_1)
      menu.add(dish_2)
      expect(menu.get_menu).to eq [dish_1, dish_2]
    end

    it "returns all items on menu #2" do
      menu = Menu.new
      dish_1 = double :dish      
      dish_2 = double :dish        
      dish_3 = double :dish       
      dish_4 = double :dish        
      menu.add(dish_1)
      menu.add(dish_2)
      menu.add(dish_3)
      menu.add(dish_4)
      expect(menu.get_menu).to eq [dish_1, dish_2, dish_3, dish_4]
    end
  end
end