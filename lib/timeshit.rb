#!/usr/bin/env ruby

require 'rubygems'
require 'commander'
require_relative 'timeshit/version'
require_relative 'timeshit/commands'

module Timeshit
  class Runner
    include Commander::Methods

    def run
      program :name, 'timeshit'
      program :version, '0.0.1'
      program :description, 'Chomps down skd csv and spits out something useful'

      command :read do |c|
        c.syntax = 'timeshit read <file.csv> [options]'
        c.summary = ''
        c.description = ''
        c.example 'read csv export and output something useful', 'timeshit read export.csv'
        c.option '--some-switch', 'Some switch that does something'
        c.when_called Timeshit::Commands::Read
      end

      run!
    end
  end
end
