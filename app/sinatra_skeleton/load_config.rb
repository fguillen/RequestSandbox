require "yaml"

module SinatraSkeleton
  CONFIG = YAML.load(File.read("#{File.dirname(__FILE__)}/../../config.yml"))
end