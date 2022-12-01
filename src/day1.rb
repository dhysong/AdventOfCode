#!/usr/bin/env ruby

require_relative 'VAR'
require 'httparty'

response = HTTParty.get("https://adventofcode.com/2022/day/1/input", {headers: {'Cookie' => VAR::AUTHCOOKIE }} )

resp = response.body if response.code == 200

elfLoads = resp.split("\n")

currentLoad = 0
elfLoadSums = []
elfLoads.each { |load| 
    if load == ''
        elfLoadSums.append(currentLoad)
        currentLoad = 0
    else 
        currentLoad += load.to_i
    end
}

top3 = elfLoadSums.sort.reverse.take(3)
top3Total = top3.sum
maxLoad = top3.max

puts top3Total
puts maxLoad

