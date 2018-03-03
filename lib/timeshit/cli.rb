#!/usr/bin/env ruby

require 'rubygems'
require 'csv'
require 'thor'

module Timeshit
  class CLI < Thor
    CSV_OPTS = {
      col_sep: ';',
      quote_char:'"',
      headers: true,
      force_quotes: true,
      header_converters: :symbol
    }.freeze

    option :filter
    option :rate => :number
    desc "read FILE", "read exported SKD timereport csv file"
    def read(filename)
      filter = options[:filter]
      rate = options[:rate] || 1297.0
      total = 0.0

      CSV.open(filename, 'r:bom|utf-8', CSV_OPTS) do |csv|
        csv.each do |row|
          code = row[:dimensjon_4]
          filtered_out = filter && !code.include?(filter)

          next if code.empty? || filtered_out

          hrs = row[:sum].split(":")[0].to_i
          min = row[:sum].split(":")[1].to_i
          sum = hrs+(min.to_i/60.0).round(2)
          puts "    #{row[:dato]}:    #{code[/\d+/]}     #{sum}"
          total+=sum
        end
      end

      puts "------------------------------------"
      puts "             rate: #{rate}"
      puts "        total hrs: #{total.round(2)}"
      puts "   total earnings: #{(total * rate).round(2)}"
      puts "         your cut: #{(total * rate * 0.6).round(2)}"
      puts "        after tax: #{(total * rate * 0.6 * 0.6).round(2)}"
      puts "   after vacation: #{(total * rate * 0.6 * 0.6 * 0.88).round(2)}"
      puts "------------------------------------"
    end
  end
end
