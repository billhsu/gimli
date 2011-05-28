# encoding: utf-8

module Gimli

  # Class used to interact with directory structure
  class Path

    # Return an array of paths to valid markup file matching the passed pattern
    # @param [String] target
    # @param [Bool] recursive
    def self.list_valid(target, recursive = false)
      if recursive
        target ||= Dir.pwd
        if File.directory?(target)
          target = File.join(target, '**', '*')
        end
      else
        target ||= Dir.pwd
        if File.directory?(target)
          target = File.join(target, '*')
        end
      end
      Dir.glob(target).keep_if { |file| MarkupFile.new(file).valid? }
    end
  end
end
