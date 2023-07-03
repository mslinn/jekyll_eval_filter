require 'jekyll_plugin_logger'

# Sample Jekyll filter.
module JekyllEvalFilter
  class << self
    attr_accessor :logger
  end
  self.logger = PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)

  # This Jekyll filter evaluates the input string and returns the result.
  # Use it as a calculator or one-line Ruby program evaluator.
  #
  # @param input_string [String].
  # @return [String] input string and the evaluation result.
  # @example Use like this:
  #   {{ 'TODO: show typical input' | eval }} => "TODO: show output"
  def evaluate(input_string)
    input_string.strip!
    JekyllEvalFilter.logger.debug { "input_string=#{input_string}" }
    Kernel.eval input_string.strip
  end

  PluginMetaLogger.instance.logger.info { 'Loaded evaluate Liquid filter.' }
end

Liquid::Template.register_filter JekyllEvalFilter
