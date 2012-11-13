# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Unit.create([{name: 'min'}, {name: 'kg'}, {name: 'lbs.'}, {name: 'pound'}])
Country.create([{code: "DE", name: "Deutschland"}, {code: "CH", name: "Schweiz"}, {code: "AT", name: "Oesterreich"}])
Category.create([{name: "Weight loss", unit_id: 1}])
