require 'jekyll'
require 'jekyll_plugin_logger'
require 'jekyll_plugin_support'

require_relative 'jekyll_eval_filter/version'

# Require all Ruby files in 'lib/', except this file
Dir[File.join(__dir__, '*.rb')].sort.each do |file|
  require file unless file.end_with?('/jekyll_eval_filter.rb')
end
