# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string
#  verified   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#
# Indexes
#
#  index_quotes_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Quote < ApplicationRecord
  validates :name, presence: true

  after_create_commit :broadcast_created_quote
  after_update_commit :broadcast_changed_quote
  after_destroy_commit :broadcast_removed_quote

  belongs_to :company

  OFFICIAL_BADGE = "Blue tick"

  def verification_badge
    verified ? OFFICIAL_BADGE : ""
  end

  def broadcast_created_quote
    broadcast_prepend_to "quotes",
                         partial: "quotes/quote",
                         locals: { quote: self },
                         target: "quotes"
  end

  def broadcast_changed_quote
    broadcast_replace_to "quotes",
                         partial: "quotes/quote",
                         locals: { quote: self },
                         target: self
  end

  def broadcast_removed_quote
    broadcast_remove_to "quotes", target: self
  end
end
