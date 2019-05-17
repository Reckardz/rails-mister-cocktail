# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_data = open(url).read
ingredients = JSON.parse(ingredients_data)

ingredients["drinks"].each do |ingredient|
  puts ingredient["strIngredient1"]
  Ingredient.create(name: ingredient["strIngredient1"])
end
