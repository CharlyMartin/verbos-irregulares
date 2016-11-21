class TempEmail < ApplicationRecord
  validates :f_name, :l_name, :email, presence: :true
end
