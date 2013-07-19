require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scraper(uri)
  sizes, measurements, measurements_array = [], [], []

  page = Nokogiri::HTML(open(uri))
  table = page.at_css("table")

  table.css("td.size1").each do |y|
    sizes.push y.text
  end
  sizes.delete_at 0

  table.css("td:not(.size1)").each do |q|
    measurements.push q.text
  end
  measurements.delete("Measured Size")
  measurements.reject!(&:empty?)

  sliced = measurements.each_slice(6).to_a
  keys = sliced[0]
  sliced.each do |x|
    measurements_array.push  Hash[keys.zip x]
  end
  measurements_array.delete_at 0
  hashy = Hash[sizes.zip measurements_array]
  return hashy
end


