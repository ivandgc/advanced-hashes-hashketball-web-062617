require 'pry'

def game_hash

game_hash ={
  home: {
    team_name: "Brooklyn Nets",
    colors:["Black", "White"],
    players:{
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks:12,
        slam_dunks:7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number:1,
        shoe:19,
        points:26,
        rebounds:12,
        assists:6,
        steals:3,
        blocks:8,
        slam_dunks:5
      },
      "Jason Terry" => {
        number:31,
        shoe:15,
        points:19,
        rebounds:2,
        assists:2,
        steals:4,
        blocks:11,
        slam_dunks:1
      }
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors:["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number:4,
        shoe:18,
        points:10,
        rebounds:1,
        assists:1,
        steals:2,
        blocks:7,
        slam_dunks:2
      },
      "Bismak Biyombo" => {
        number:0,
        shoe:16,
        points:12,
        rebounds:4,
        assists:7,
        steals:7,
        blocks:15,
        slam_dunks:10
      },
      "DeSagna Diop" => {
        number:2,
        shoe:14,
        points:24,
        rebounds:12,
        assists:12,
        steals:4,
        blocks:5,
        slam_dunks:5
      },
      "Ben Gordon" => {
        number:8,
        shoe:15,
        points:33,
        rebounds:3,
        assists:2,
        steals:1,
        blocks:1,
        slam_dunks:0
      },
      "Brendan Haywood" => {
        number:33,
        shoe:15,
        points:6,
        rebounds:12,
        assists:12,
        steals:22,
        blocks:5,
        slam_dunks:12
      }
    }
  }
}

end

def num_points_scored(name)

  points_scored = nil
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :players
        data.each do |player_name, stats_hash|
          if player_name == name
            stats_hash.each do |stat, value|
              if stat == :points
                points_scored = value
              end
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(name)

  shoe_size = nil
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :players
        data.each do |player_name, stats_hash|
          if player_name == name
            stats_hash.each do |stat, value|
              if stat == :shoe
                shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  shoe_size

end

def team_colors (name)
  team = nil
  colors = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == name
        team = data
      end
      if attribute == :colors && name == team
        colors = data
        team = nil
      end
    end
  end
  colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :team_name
        team_names << data
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  team = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team = data
      end
      if attribute == :players && team == team_name
        data.each do |player_name, stats_hash|
          stats_hash.each do |stat, value|
            if stat == :number
              jersey_numbers << value
            end
          end
        end
        team = nil
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :players
        data.each do |player_name, stats_hash|
          if player_name == name
            player_stats = stats_hash
          end
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  big_shoe_player = nil
  shoe_size_biggest = nil
  big_shoe_rebounds = nil
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute == :players
        data.each do |player_name, stats_hash|
          stats_hash.each do |stat, value|
            if stat == :shoe
              if shoe_size_biggest == nil || shoe_size_biggest < value
                shoe_size_biggest = value
                big_shoe_player = player_name
              end
            end
            if stat == :rebounds && big_shoe_player == player_name
              big_shoe_rebounds = value
              big_shoe_player = nil
            end
          end
        end
      end
    end
  end
  big_shoe_rebounds
end
