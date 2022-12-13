# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string
#  verified   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
  validates :name, presence: true

  after_create_commit :broadcast_change_to_subscribers

  OFFICIAL_BADGE = "Blue tick"

  def verification_badge
    verified ? OFFICIAL_BADGE : ""
  end

  def broadcast_change_to_subscribers
    broadcast_prepend_to "quotes",
                         partial: "quotes/quote",
                         locals: { quote: self },
                         target: "quotes"
  end
end
