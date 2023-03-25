class CustomerInterface
  def initialize(name, mobile = 11234123456)
    @name = name
    @mobile = mobile
  end

  def view_menu(menu) # menu is an instance of Menu
    menu.
  end
  
  def view_order(order) # order is an instance of Order

  end

  def view_receipt(receipt) # receipt is an instance of Receipt

  end

  def build_order(order) # order is an instance of Order

  end
end