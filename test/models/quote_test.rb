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
require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
