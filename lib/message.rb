require 'twilio-ruby'
require "dotenv/load"

class Message
  def initialize(mobile = "02345123456")
    @sid = ENV['TWILIO_AC_SID']
    @auth = ENV['TWILIO_AUTH_TOKEN']
    @receiver = mobile[1..-1].prepend("+44")
    @sender = ENV['TWILIO_NUMBER'] # twilio number
    @time = Time.now
    @eta = @time + 2400
  end

  def message_body
    "Thank you! Your order was placed and will be delivered before #{@eta.strftime("%k:%M")}"
  end

  def send_text
    client = Twilio::REST::Client.new(@sid, @auth)
    client.messages.create(
      from: @sender,
      to: @receiver,
      body: message_body()
    )
  end
end
