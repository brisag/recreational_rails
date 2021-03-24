# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
@moab_office = Office.create(name: 'Alamosa Office', capacity: 50, first_aid: false )
