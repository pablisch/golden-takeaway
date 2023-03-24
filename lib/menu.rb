class Menu
  def initialize
    @menu = []
  end

  def add(dish)
    @menu << dish
  end

  def get_menu
    fail "Disappoitment is the only thing on the menu today." if @menu.empty?
    @menu
  end
end