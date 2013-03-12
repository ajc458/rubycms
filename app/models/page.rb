class Page < ActiveRecord::Base
  
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  
  validates_presence_of :name
    
  attr_accessible :subject_id, :name, :permalink, :position, :visible
  
end
