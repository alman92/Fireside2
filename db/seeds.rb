# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all
Comment.destroy_all

# NHO: I think you actually need to pass a tablename to the below method, i.e. topics
ActiveRecord::Base.connection.reset_pk_sequence!('TABLENAME')

Topic.create([
  {name: "Accounting"},
  {name: "Advertising"},
  {name: "Aerospace"},
  {name: "Agriculture"},
  {name: "Alcohol & Drug Abuse"},
  {name: "Animals"},
  {name: "Apparel/Clothing Industry/Textiles"},
  {name: "Arts/Entertainment"},
  {name: "Automotive Industry"},
  {name: "Aviation/Aircraft/Airlines"},
  {name: "Banking"},
  {name: "Bankruptcy"},
  {name: "Beverage Industry"},
  {name: "Budget/Appropriations"},
  {name: "Chemicals/Chemical Industry"},
  {name: "Civil Rights/Civil Liberties"},
  {name: "Clean Air & Water (Quality)"},
  {name: "Commodities (Big Ticket)"},
  {name: "Communications/Broadcasting/Radio/TV"},
  {name: "Computer Industry"},
  {name: "Constitution"},
  {name: "Consumer Issues/Safety/Protection"},
  {name: "Copyright/Patent/Trademark"},
  {name: "Defense"},
  {name: "Disaster Planning/Emergencies"},
  {name: "District of Columbia"},
  {name: "Economics/Economic Development"},
  {name: "Education"},
  {name: "Energy/Nuclear"},
  {name: "Enviromental/Superfund"},
  {name: "Family Issues/Abortion/Adoption"},
  {name: "Financial Institutions/Investments/Securities"},
  {name: "Firearms/Guns/Ammunition"},
  {name: "Food Industry (Safety, Labeling, etc.)"},
  {name: "Foreign Relations"},
  {name: "Fuel/Gas/Oil"},
  {name: "Gaming/Gambling/Casino"},
  {name: "Government Issues"},
  {name: "Health Issues"},
  {name: "Housing"},
  {name: "Immigration"},
  {name: "Indian/Native American Affairs"},
  {name: "Insurance"},
  {name: "Labor Issues/Antitrust/Workplace"},
  {name: "Law Enforcement/Crime/Criminal Justice"},
  {name: "Manufacturing"},
  {name: "Marine/Maritime/Boating/Fisheries"},
  {name: "Media (Information/Publishing)"},
  {name: "Medical/Disease Research/Clinical Labs"},
  {name: "Medicare/Medicaid"},
  {name: "Minting/Money/Gold Standard"},
  {name: "Natural Resources"},
  {name: "Other"},
  {name: "Pharmacy"},
  {name: "Postal"},
  {name: "Railroads"},
  {name: "Real Estate/Land Use/Conservation"},
  {name: "Religion"},
  {name: "Retirement"},
  {name: "Roads/Highway"},
  {name: "Science/Technology"},
  {name: "Small Business"},
  {name: "Sports/Athletics"},
  {name: "Telecommunications"},
  {name: "Tobacco"},
  {name: "Torts"},
  {name: "Trade (Domestic & Foreign)"},
  {name: "Transportation"},
  {name: "Travel/Tourism"},
  {name: "Trucking/Shipping"},
  {name: "Unemployment"},
  {name: "Urban Development/Municipalities"},
  {name: "Utilities"},
  {name: "Veterans"},
  {name: "Waste (hazardous/solid/interstate/nuclear)"},
  {name: "Welfare"}
])
