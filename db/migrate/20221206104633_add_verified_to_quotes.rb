class AddVerifiedToQuotes < ActiveRecord::Migration[7.0]
  def change
    add_column :quotes, :verified, :boolean, default: false, null: false
  end
end
