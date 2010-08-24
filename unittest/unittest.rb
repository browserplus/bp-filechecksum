#!/usr/bin/env ruby

require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))),
                  'external/dist/share/service_testing/bp_service_runner.rb')
require 'uri'
require 'test/unit'
require 'open-uri'
require 'rbconfig'
include Config

class TestFileChecksum < Test::Unit::TestCase
  def setup
    subdir = 'build/FileChecksum'
    if ENV.key?('BP_OUTPUT_DIR')
      subdir = ENV['BP_OUTPUT_DIR']
    end
    @cwd = File.dirname(File.expand_path(__FILE__))
    @service = File.join(@cwd, "../#{subdir}")
  end
  
  def teardown
  end

  def test_load_service
    # NEEDSWORK!!!  Need to figure out how to host RubyInterpreter to get these tests running
    #BrowserPlus.run(@service) { |s|
    #}
  end

  # BrowserPlus.FileChecksum.md5({params}, function{}())
  # Generate an md5 checksum of a file.
  def test_file_checksum
    # NEEDSWORK!!!  Need to figure out how to host RubyInterpreter to get these tests running
    #BrowserPlus.run(@service) { |s|
    #  # Real checksum.
    #  Dir.glob(File.join(File.dirname(__FILE__), "cases", "*.json")).each do |f|
    #    json = JSON.parse(File.read(f))
    #    file = json["file"]
    #    textfile_path = File.expand_path(File.join(@cwd, "test_files", file))
    #    textfile_uri = "path://" + testfile_path
    #    want = Digest::MD5.hexdigest(File.read(textfile_path))
    #    got = s.md5({ "file" => textfile_uri }),
    #    assert_equal(want, got)
    #  end
    #}
  end

  def test_file_checksum_filenotexist
    # NEEDSWORK!!!  Need to figure out how to host RubyInterpreter to get these tests running
    #BrowserPlus.run(@service) { |s|
    #  # Fake checksum.
    #  Dir.glob(File.join(File.dirname(__FILE__), "cases", "*.json")).each do |f|
    #    json = JSON.parse(File.read(f))
    #    file = json["file"] + (48 + rand(80)).chr
    #    fakefile_path = File.expand_path(File.join(@cwd, "test_files", file))
    #    fakefile_uri = "path://" fakefile_path
    #    assert_raise(RuntimeError) { got = s.md5({ "file" => fakefile_uri }) }
    #  end
    #}
  end
end
