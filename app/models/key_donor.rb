class KeyDonor < ApplicationRecord
  belongs_to :Students
  belongs_to :Donor
  belongs_to :donation
end
