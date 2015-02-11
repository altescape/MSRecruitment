class Candidate < ActiveRecord::Base
  validates_presence_of :name, :gender, :experience, :position, :area, :email, :phone
end
