require 'jekyll'
require 'jekyll_plugin_logger'
require 'fileutils'
require 'yaml'
require_relative '../lib/jekyll_eval_filter'

RSpec.configure do |config|
  # config.order = 'random'
  config.filter_run_when_matching focus: true

  # See https://relishapp.com/rspec/rspec-core/docs/command-line/only-failures
  config.example_status_persistence_file_path = '../spec/status_persistence.txt'
end

Registers = Struct.new(:page, :site)

# Mock for Collections
class Collections
  def values
    []
  end
end

# Mock for Site
class SiteMock
  attr_reader :config

  def initialize
    @config = YAML.safe_load_file('../demo/_config.yml')
    @config['env'] = { 'JEKYLL_ENV' => 'development' }
  end

  def collections
    Collections.new
  end
end

class TestLiquidContext < Liquid::Context
  def initialize
    super

    page = {
      'content'     => 'blah blah',
      'description' => 'Jekyll plugin support demo',
      'dir'         => '/',
      'excerpt'     => nil,
      'layout'      => 'default',
      'name'        => 'index.html',
      'path'        => 'index.html',
      'title'       => 'Welcome',
      'url'         => '/',
    }

    @content = 'Interior of the tag'
    @registers = Registers.new(
      page,
      SiteMock.new
    )
  end
end

# Mock for Liquid::ParseContent
class TestParseContext < Liquid::ParseContext
  attr_reader :line_number, :registers

  def initialize
    super
    @line_number = 123

    @registers = Registers.new(
      { 'path' => 'path/to/page.html' },
      SiteMock.new
    )
  end
end
