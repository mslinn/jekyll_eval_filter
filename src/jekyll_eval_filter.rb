require 'jekyll_plugin_logger'

module jekyll_eval_filter
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
  #   {{ '11 + 21/3' | <%= filter_name %> }} => "<pre>11 + 21/3 = 18</pre>"
  def my_filter(input_string)
    input_string.strip!
    MyJekyllFilter.logger.debug { "input_string=#{input_string}" }
    "<pre>#{input_string} = #{eval input_string}</pre>" # rubocop:disable Security/Eval
  end

  PluginMetaLogger.instance.logger.info { "Loaded #{self.class} plugin." }
end

Liquid::Template.register_filter 'eval'

