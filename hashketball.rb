# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def player_stats(player_name)
  game_hash.each do |team, team_hash|
    #binding.pry
    team_hash.each do |attribute, data|
      #binding.pry
      if attribute == :players
        data.each do |player_array|
          if player_array[:player_name] == player_name
            return player_array
          end
        end
      end
    end
  end
end

def num_points_scored(player_name)
  player_array = player_stats(player_name)
  player_array[:points]
end

def shoe_size(player_name)
  player_array = player_stats(player_name)
  player_array[:shoe]
end

def team_colors(team_name)
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      team_hash.each do |attribute, data|
        if attribute == :colors
          return data
        end
      end
    end
  end
end

def team_names
  output = []
  game_hash.each do |team, team_hash|
    output << team_hash[:team_name]
  end
  output
end

def winning_team
  total_points = []
  game_hash.each do |team, team_hash|
    team_hash.each do |attribute, data|
      team_total = 0
      if attribute == :players
        data.each do |player_array|
          team_total += player_array[:points]
        end
      end
      if team_total != 0
        total_points << team_total
      end
    end
  end
  if (total_points[0] > total_points[1])
    team_names[0]
  else
    team_names[1]
  end
end

def player_with_longest_name
  names = []
  game_hash.each do |team, team_hash|
    team_hash.each do |attribute, data|
      if attribute == :players
        data.each do |player_array|
          names << player_array[:player_name]
        end
      end
    end
  end

  names.max_by(&:length)

end

def long_name_steals_a_ton?
  longest_steals = player_stats(player_with_longest_name)[:steals]
  max_steals = 0

  game_hash.each do |team, team_hash|
    team_hash.each do |attribute, data|
      if attribute == :players
        data.each do |player_array|
          if player_array[:steals] > max_steals
            max_steals = player_array[:steals]
          end
        end
      end
    end
  end

  if longest_steals == max_steals
    true
  else
    false
  end
end

def player_numbers(team_name)
  output = []
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      team_hash.each do |attribute, data|
        if attribute == :players
          data.each do |player_array|
            output << player_array[:number]
          end
        end
      end
    end
  end
  output
end

def big_shoe_rebounds
  max = -1
  rebounds = -1
  game_hash.each do |team, team_hash|
    team_hash.each do |attribute, data|
      if attribute == :players
        data.each do |player_array|
          if player_array[:shoe] > max
            max = player_array[:shoe]
            rebounds = player_array[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  max_points = -1
  max_scorer = nil
  game_hash.each do |team, team_hash|
    team_hash.each do |attribute, data|
      if attribute == :players
        data.each do |player_array|
          if player_array[:points] > max_points
            max_points = player_array[:shoe]
            max_scorer = player_array[:player_name]
          end
        end
      end
    end
  end
  max_scorer
end
