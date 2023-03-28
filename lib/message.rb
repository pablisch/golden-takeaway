require 'twilio-ruby'
require "dotenv/load"

class Message
  def initialize(mobile = "02345123456")
    @sid = ENV['TWILIO_AC_SID']
    @auth = ENV['TWILIO_AUTH_TOKEN']
    @receiver = mobile
    @sender = ENV['TWILIO_NUMBER'] # twilio number
    @time = Time.now
    @eta = @time + 2400
  end

  def message_body
    "Thank you! Your order was placed and will be delivered before #{@eta.strftime("%k:%M")}"
  end

  def mobile_edit(mobile)
    @receiver = 1 # complete this to transform the number to a valid number
  end

  def send_text
    
    # p @sender
    # p @receiver
    client = Twilio::REST::Client.new(@sid, @auth)
    client.messages.create(
      from: @sender,
      to: @receiver,
      body: message_body()
    )
  end
end
