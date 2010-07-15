#
# ***** BEGIN LICENSE BLOCK *****
# The contents of this file are subject to the Mozilla Public License
# Version 1.1 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
# 
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
# License for the specific language governing rights and limitations
# under the License.
# 
# The Original Code is BrowserPlus (tm).
# 
# The Initial Developer of the Original Code is Yahoo!.
# Portions created by Yahoo! are Copyright (c) 2010 Yahoo! Inc.
# All rights reserved.
# 
# Contributor(s): 
# ***** END LICENSE BLOCK *****

#
# A simple BrowserPlus service implemented in Ruby that will calculate the
# MD5 sum of a file that a user has selected
#
  
class FileChecksumInstance
  # args contains 'url', 'data_dir', 'temp_dir'
  def initialize(args)
  end

  def md5(bp, args)
    begin
      bp.complete(Digest::MD5.hexdigest(File.open(args['file'].realpath, "rb") { |f| f.read }))
    rescue Exception => err
      bp_log("error", "[FileChecksum] ERROR : #{err.to_s}")
      bp.error("Error", err.to_s)
    end
  end
end

rubyCoreletDefinition = {
  'class' => "FileChecksumInstance",
  'name' => "FileChecksum",
  'major_version' => 1,
  'minor_version' => 0,  
  'micro_version' => 9,  
  'documentation' => 'Allows client side MD5 of user selected files.',
  'functions' =>
  [
    {
      'name' => 'md5',
      'documentation' => "Generate an md5 checksum of a file.",
      'arguments' =>
      [
        {
          'name' => 'file',
          'type' => 'path',
          'documentation' => 'The file for which to calculate a checksum.',
          'required' => true
        }
      ]
    }
  ]
}
