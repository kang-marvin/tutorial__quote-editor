# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
  validates :name, presence: true
end
