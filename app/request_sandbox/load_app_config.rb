require "yaml"

module RequestSandbox
  CONFIG = YAML.load(File.read("#{File.dirname(__FILE__)}/../../config/app_config.yml"))
end