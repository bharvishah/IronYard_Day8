
require 'pry'
class Panda

@@pandas = []
  def self.all
  end

  def self.all_pandas

    @@pandas
  end

  def self.kill_all
    @@pandas.each do |panda|
      panda.kill
    end

  end

  def initialize(name)
    @name = name
    @alive = true
    #binding.pry
    #self
    @@pandas << self # coz we want an array of objects of panda and not array of strings
  end

  def kill
    @alive = false
  end

end

# track all pendas created
# be able to kill all pandas

panda_joe = Panda.new("Joe")
panda_wo = Panda.new("Wo")
#panda.me = Panda.new("me")

p Panda.all_pandas

puts "Killing the pandas"

Panda.kill_all

p Panda.all_pandas

puts "-----------"

p "PandaWo: #{panda_wo.inspect}"

puts "_____________"
