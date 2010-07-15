#
# A simple BrowserPlus service implemented in Ruby that will calculate the
# MD5 sum of a file that a user has selected
#
# (c) Yahoo! Inc. 2008
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
