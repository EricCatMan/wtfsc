require "bunny"

conn = Bunny.new(:port => 5673)
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"
q.subscribe(:block => true) do |delivery_info, properties, body|
  puts " [x] Received #{body}"

  sleep(2)

  puts " [x] Received #{body} end"

  # cancel the consumer to exit
  delivery_info.consumer.cancel

end
