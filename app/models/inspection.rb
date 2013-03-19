class Inspection < ActiveRecord::Base
  validates :inspection_id, uniqueness: true
end
