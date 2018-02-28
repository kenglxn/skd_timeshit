#!/usr/bin/env ruby

require 'rubygems'
require 'csv'
require 'thor'
require_relative 'timeshit/version'

class Timeshit < Thor
  CSV_OPTS = {
    col_sep: ';',
    quote_char:'"',
    headers: true,
    force_quotes: true,
    header_converters: :symbol
  }.freeze

  desc "read FILE", "read csv file"
  def read(filename)

    CSV.open(filename, 'r:bom|utf-8', CSV_OPTS) do |csv|
      csv.each do |row|
        p row.inspect
      end
    end
  end
end
