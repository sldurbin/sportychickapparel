input_file = "#{Rails.root}/lib/data/sportyChickInventory.csv"

def get_team_id(league_name, team_name)
  return if league_name.nil? or league_name.empty? or team_name.nil? or team_name.empty?

  league = League.find_or_create_by_name(league_name)
  if Team.find_by_name(team_name).nil? 
    team = Team.create!(:name => team_name, :league_id => league.id) 
  else
    team = Team.find_by_name(team_name)
  end
  return team.id
end

def process_line(apparel_name, shoe_name, brand_name, sport_name, 
                  clearance, fan_gear, league, team, link, image, price)
  (apparel_name.nil? or apparel_name.empty?) ? apparel_id = nil : 
                  apparel_id = Apparel.find_or_create_by_name(apparel_name).id
  (shoe_name.nil? or shoe_name.empty?) ? shoe_id = nil : 
                  shoe_id = Shoe.find_or_create_by_name(shoe_name).id
  (brand_name.nil? or brand_name.empty?) ? brand_id = nil : 
                  brand_id = Brand.find_or_create_by_name(brand_name).id
  (sport_name.nil? or sport_name.empty?) ? sport_id = nil : 
                  sport_id = Sport.find_or_create_by_name(sport_name).id
  #TODO: handle clearance
  team_id = get_team_id(league, team)
                  
  i = Item.new(:link => link, :image => image, :price => price, :apparel_id => apparel_id, :shoe_id => shoe_id,
                 :brand_id => brand_id, :sport_id => sport_id, :team_id => team_id)
  i.save!
end

task :import_data => :environment do 
  Item.destroy_all
  File.readlines(input_file).each do |line|
    unless line =~ /^Apparel/
      line_items = line.split(',')
      apparel_name = line_items[0].strip
      shoe_name = line_items[1].strip
      brand_name = line_items[2].strip
      sport_name = line_items[3].strip
      clearance = line_items[4].strip
      fan_gear = line_items[5].strip
      league = line_items[6].strip
      team = line_items[7].strip
      link = line_items[8].strip
      image = line_items[9].strip
      price = line_items[10].strip
      puts "Processing: #{apparel_name},#{shoe_name},#{brand_name},#{sport_name}, \
        #{fan_gear},#{league},#{team}"
      process_line(apparel_name, shoe_name, brand_name, sport_name, 
                    clearance, fan_gear, league, team, link, image, price)
    end
  end
end
