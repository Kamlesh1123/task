class CreateEntries < ActiveRecord::Migration[6.1]
  def change
     add_column :entries, :image, :string  
    create_table :entries do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.string :image


      t.timestamps
    end
  end
end
