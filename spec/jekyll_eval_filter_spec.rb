require_relative '../lib/jekyll_eval_filter'

RSpec.describe JekyllEvalFilter do
  let(:logger) do
    PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)
  end

  let(:parse_context) { TestParseContext.new }

  it 'has a test', skip: 'not implemented' do
    expect(true).to be_truthy
  end
end
