#!/usr/bin/env ruby

require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))),
                  'external/dist/share/service_testing/bp_service_runner.rb')
require 'uri'
require 'test/unit'
require 'open-uri'
require 'rbconfig'
include Config
require 'digest/md5'

class TestFileChecksum < Test::Unit::TestCase
  def setup
    subdir = 'build/FileChecksum'
    if ENV.key?('BP_OUTPUT_DIR')
      subdir = ENV['BP_OUTPUT_DIR']
    end
    @cwd = File.dirname(File.expand_path(__FILE__))
    @service = File.join(@cwd, "../#{subdir}")
    @providerDir = File.expand_path(File.join(@cwd, "providerDir"))
  end
  
  def teardown
  end

  def test_load_service
    BrowserPlus.run(@service, @providerDir) { |s|
    }
  end

  # BrowserPlus.FileChecksum.md5({params}, function{}())
  # Generate an md5 checksum of a file.
#  def test_file_checksum
#    BrowserPlus.run(@service, @providerDir) { |s|
#      # Real checksum.
#      Dir.glob(File.join(File.dirname(__FILE__), "cases", "*.json")).each do |f|
#        json = JSON.parse(File.read(f))
#        file = json["file"]
#        textfile_path = File.expand_path(File.join(@cwd, "test_files", file))
#        textfile_uri = "path:" + textfile_path
#        want = Digest::MD5.hexdigest(File.read(textfile_path))
#        got = s.md5({ "file" => textfile_uri })
#        assert_equal(want, got)
#      end
#    }
#  end
#
#  def test_file_checksum_filenotexist
#    BrowserPlus.run(@service, @providerDir) { |s|
#      # Fake checksum.
#      Dir.glob(File.join(File.dirname(__FILE__), "cases", "*.json")).each do |f|
#        json = JSON.parse(File.read(f))
#        file = json["file"] + (48 + rand(80)).chr
#        fakefile_path = File.expand_path(File.join(@cwd, "test_files", file))
#        fakefile_uri = "path:" + fakefile_path
#        assert_raise(RuntimeError) { got = s.md5({ "file" => fakefile_uri }) }
#      end
#    }
#  end
end
