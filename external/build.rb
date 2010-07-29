#!/usr/bin/env ruby

topDir = File.dirname(__FILE__)
require File.join(topDir, "bakery/ports/bakery")

$order = {
  :output_dir => File.join(File.dirname(__FILE__), "built"),
  :packages => [
                "service_testing"
               ],
  :verbose => true,
}

b = Bakery.new $order
b.build
