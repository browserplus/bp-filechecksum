#!/usr/bin/env ruby

require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))),
                  'external/built/share/service_testing/bp_service_runner.rb')
require 'uri'
require 'test/unit'
require 'open-uri'

class TestFileChecksum < Test::Unit::TestCase
  def setup
    #curDir = File.dirname(__FILE__)
    #pathToService = File.join(curDir, "..", "src", "build", "FileChecksum")
    #@s = BrowserPlus::Service.new(pathToService)

    #@binfile_path = File.expand_path(File.join(curDir, "service.bin"))
    #@binfile_uri = (( @binfile_path[0] == "/") ? "file://" : "file:///" ) + @binfile_path

    #@textfile_path = File.expand_path(File.join(curDir, "services.txt"))
    #@textfile_uri = (( @textfile_path[0] == "/") ? "file://" : "file:///" ) + @textfile_path
  end
  
  def teardown
    #@s.shutdown
  end

  def test_noop
  end
end
