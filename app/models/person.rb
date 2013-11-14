class Person < ActiveRecord::Base
  has_many :casts
  has_many :movies, through: :casts
  
  validates_presence_of :name, :surname

  def complete_name
    "#{self.name} #{self.surname}"
  end
end
