class Kind < ApplicationRecord
  
  has_many :foods

  def hashed
    h = {}
    self.each {|k| h[k.id] = k.name}
  end

  def hello
    puts "hello"
  end
end
