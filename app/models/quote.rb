class Quote < ApplicationRecord
  # This line will prevent any new quote from being saved without a "saying" input
  # with minimum of 3 and 140 characters long 
  validates :saying, presence: true, length: { maximum: 140, minimum: 3 }
  validates :author, presence: true, length: {maximum: 50, minimum: 3 }
end
