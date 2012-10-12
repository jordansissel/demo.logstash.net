require "pathname"
dir = Pathname.new(File.dirname(__FILE__)).realpath
file_cache_path File.join(dir, "cache")
cookbook_path File.join(dir, "cookbooks")
data_bag_path File.join(dir, "databags")
