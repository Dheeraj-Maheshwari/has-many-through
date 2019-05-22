class Patient < ApplicationRecord
  after_create :update_city
  has_many :appointments
  has_many :doctors, :through => :appointments
  scope :allergies, lambda { where(:allergies => false) }
  # scope :allergies, -> { where(allergies: true) }
  # scope :allergies, Proc.new { where(:allergies => true) }
  private
  def update_city
   self.update_column(:city, "bhopal")
 end
  # accepts_nested_attributes_for :appointments
end