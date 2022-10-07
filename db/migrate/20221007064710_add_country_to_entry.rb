class AddCountryToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :country, :string
  end
end
