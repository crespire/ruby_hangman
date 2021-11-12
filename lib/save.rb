# hangman/lib/save.rb
# frozen_string_literal: true

require 'yaml'

module Hangman
  class Save
    def initialize
    end

    def self.serialize(obj = {})
      instance_variables.map do |var|
        obj[var] = instance_variable_get(var)
      end

      YAML.dump(obj)
    end

    def self.save_to_file(filename, dump)
      File.open("#{filename}.yml", 'w') { |f| f.write(dump) }
    end

    def self.load_from_file(filename)
      data = YAML.load(File.read("#{filename}.yml"))
    end
  end
end