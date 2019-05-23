class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id=nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id= ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]
    
    new_pokemon = self.new(id: id, name: name, type: type, db: db)
  end
  
end
