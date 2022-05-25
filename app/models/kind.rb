class Kind < ApplicationRecord
  
  has_many :foods, dependent: :destroy

  def hashed
    h = {}
    self.each {|k| h[k.id] = k.name}
  end

  def hello
    puts "hello"
  end
end
