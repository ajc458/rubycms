class Subject < ActiveRecord::Base
  has_many :pages
  
  attr_accessible :name, :position, :visible
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
