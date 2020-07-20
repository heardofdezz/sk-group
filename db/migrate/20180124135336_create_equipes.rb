class CreateEquipes < ActiveRecord::Migration[5.1]
  attr_accessible :country, :points
  belongs_to :equipetable, polymorphic: true
  after_save :write_json



  def change
    create_table :equipe do |t|
      t.string :country
      t.integer :points

      t.timestamps
    end
  end
end

def write_json
  equipes_json = []
  Equipe.all.each do |equipe|
  equipe_json = {
      "id" => equipe.id,
      "equipe" => equipe.country
      "points" => equipe.points
    }
equipes_json << equipe_json

  end
  File.open("public/equipe.json", "w") do |f|
    f.write(equipes_json.to_json)
  end
end
