class Candidate < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :phone, :position, :resume
end
