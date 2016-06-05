#
class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_many :records
end
