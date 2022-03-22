#!/usr/bin/env ruby
# ./check_port_class.rb
#
#   Requires: host/ip and port number
#   Returns: true/false if there is a TCP socket open.  Useful when checking
#     for service availability.  matt.a.feenstra@gmail.com

require 'socket'
require 'timeout'

class CheckPort

  attr_accessor :status, :host, :port

  def initialize(host, port)
    raise "\n\tsyntax:\n\t\t#{$0}\t<host> <port>" unless (
      host.is_a?(String) && (port.to_i > 0) )

    @host = host; @port = port;
    @status = is_port_open?(@host, @port)
  end

  private

    def is_port_open?(ip, port)
      begin
        Timeout::timeout(1) do
          begin
            s = TCPSocket.new(ip, port)
            s.close
            return true
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            return false
          end
        end
      rescue Timeout::Error
      end
    
      return false
    end

end # class
