# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
@moab_office = Office.create(name: 'Alamosa Office', capacity: 50, first_aid: false )
@grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
@sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
@crater_lake= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
@fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
@rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
@hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)
@bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
@dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: false)
@flattop_mountain = @rmnp_office.trails.create(name: 'Flattop Mountain', elevation: 2849, dogs_allowed: false)
