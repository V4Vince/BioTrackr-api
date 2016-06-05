class Record < ActiveRecord::Base
  belongs_to :user, inverse_of: :records
end
