class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :complaint
end
