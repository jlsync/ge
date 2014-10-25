class Referrer < ActiveRecord::Base

  belongs_to :business

  validates :business, presence: true
  validates :email, presence: true, uniqueness: { scope: :business_id }
  validates :click_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :conversion_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }





end
