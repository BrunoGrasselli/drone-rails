desc "Minify the drone lib"
task :minify_drone do
  require "open-uri"
  require "yui/compressor"

  lib = `curl https://raw.github.com/andremendonca/dronejs/master/lib/drone.js`

  compressor = YUI::JavaScriptCompressor.new
  lib.match /Version (\d+.\d+.\d+)/
  version = $1
  
  File.open("/tmp/drone.min-#{version}.js", "w") {|f| f.puts compressor.compress(lib)}
  puts "Done!"
end
