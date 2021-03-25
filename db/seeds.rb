# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true, created_at: "2018-04-13 14:45:55" )
@moab_office = Office.create(name: 'Alamosa Office', capacity: 50, first_aid: false, created_at: "2021-04-13 14:45:55" )
@zion_office = Office.create!(name: 'Zion Office', capacity: 250, first_aid: true, created_at: "1990-08-13 14:45:55")

@bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
@dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: false)
@flattop_mountain = @rmnp_office.trails.create(name: 'Flattop Mountain', elevation: 2849, dogs_allowed: false)

@delicate_arch = @moab_office.trails.create(name: 'Delicate Arch', elevation: 480, dogs_allowed: false)
@park_avenue = @moab_office.trails.create(name: 'Park Avenue', elevation: 320, dogs_allowed: false)
@double_arch = @moab_office.trails.create(name: 'Double Arch', elevation: 0, dogs_allowed: false)

@weeping_rock = @zion_office.trails.create(name: 'Weeping Rock', elevation: 98, dogs_allowed: false)
@angels_landing = @zion_office.trails.create(name: 'Angels Landing', elevation: 1488, dogs_allowed: false)
@the_narrows = @zion_office.trails.create(name: 'The Narrows', elevation: 344, dogs_allowed: false)


@grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false, created_at: "1918-04-13 14:45:55" )
@sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false, created_at: "1967-06-13 14:45:55" )
@crater_lake= Park.create!(name: 'Crater Lake', capacity: 20, permit_required: true, created_at: "2014-09-13 14:45:55" )


@fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
@rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
@hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)

@sand_boarding = @sand_dunes.programs.create!(name: 'Sandboard', num_of_participants: 6, virtual: false)
@hot_springs = @sand_dunes.programs.create!(name: 'Hot Spring Nights', num_of_participants: 12, virtual: false)
@water_catching = @sand_dunes.programs.create!(name: 'Thirst Trap', num_of_participants: 20, virtual: true)

@conspiracies = @crater_lake.programs.create!(name: 'What Crater?', num_of_participants: 6, virtual: false)
