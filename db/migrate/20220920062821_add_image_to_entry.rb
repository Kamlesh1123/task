class AddImageToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :image, :string
  end
end
