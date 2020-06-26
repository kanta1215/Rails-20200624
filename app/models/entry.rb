class Entry < ApplicationRecord
  belongs_to :room
  belongs_to :user 

  validates :reserved_date,
            :usage_time, :people, presence: true

   scope :least_entries,->(base_date) {
    where("reserved_date >= ? and reserved_date <= ?",
      base_date.to_date - 7.days, base_date.to_date + 7.days)
   }
end
