require 'bunny'

conn = Bunny.new(:port => 5673)
conn.start

ch = conn.create_channel
q  = ch.queue("hello")

ch.default_exchange.publish("Hello World!", :routing_key => q.name)

puts "[x] Sent 'Hello World!'"
conn.close
