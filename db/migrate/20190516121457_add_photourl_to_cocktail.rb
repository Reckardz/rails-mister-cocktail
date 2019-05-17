class AddPhotourlToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :photourl, :string
  end
end
