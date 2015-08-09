require 'un'
require 'socket'

bind_ip = Socket.ip_address_list.find(&:ipv4_private?).ip_address
port = "5000"
root = "./fixtures"

puts ">>> Set your preroll URL to http://#{bind_ip}:#{port}/YourFixtureFile.xml"
puts "ruby -run -e httpd -- -p #{port} -b #{bind_ip} #{root}\n\n"

%W[ -p #{port} -b #{bind_ip} #{root} ].each { |a| ARGV << a }
httpd()
