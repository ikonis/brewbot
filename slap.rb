#!/usr/local/bin/ruby

require 'cinch'

class Slap
  include Cinch::Plugin
  match(/slap (.+)/)#,{:use_prefix => false})
  def execute(m,user)
      if m.user.nick=="lirakis"
        5.times do |x|
          m.reply "*brewbot slaps #{user}"
        end
      else
        m.reply "I only do my masters bidding"
        m.reply "*brewbot slaps #{m.user.nick}"
      end 
  end
end
