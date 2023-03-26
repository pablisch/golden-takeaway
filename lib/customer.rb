class Customer
  attr_reader :name, :mobile, :verified

  def initialize(name, mobile = "01234123456")
    @name = name # string
    @mobile = mobile # string of 11 digits
    @verified = false
  end

  def check_mobile(mob_number)
    if mob_number.match(/^\d{11}$/)
      puts "Mobile number #{mob_number} verified."
      @verified = true
    else
      puts "#{mob_number} is not a valid mobile number."
      @verified = false
    end
    return @verified
  end

  def change_mobile(mob_number)
    @mobile = mob_number
    puts "Your mobile number has been changed to #{@mobile}"
  end
end