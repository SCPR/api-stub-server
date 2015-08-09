require 'webrick'
require 'socket'

bind_ip = Socket.ip_address_list.find(&:ipv4_private?).ip_address
port = "5000"
root = "./fixtures"

puts ">>> Point your app at: http://#{bind_ip}:#{port}/YourFixtureFile.xml"
puts ">>> PORT: #{port}; BIND: #{bind_ip}; ROOT: #{root}\n\n"

s = WEBrick::HTTPServer.new(
  :BindAddress => bind_ip,
  :DocumentRoot => root,
  :Port => port
)

%w[ TERM QUIT ].each do |sig|
  Signal.trap(sig, proc { s.shutdown })
end

s.start
