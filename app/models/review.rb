class Review < ApplicationRecord
  belongs_to :book
  validates:reviewer, presence:true, length: {minimum:1}
  validates:body, presence:true, length: {minimum:1}
end
