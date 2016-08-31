require 'mechanize'
require 'yaml'

class AgentFactory
  attr_reader :agent
  attr_reader :settings

  def initialize
    @agent = Mechanize.new()
  end

  def default_agent_generator
    @settings = YAML.load_file('settings.yml')

    return @agent
  end
end
