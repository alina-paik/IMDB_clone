# Movies
[
  { title: "The Shawshank Redemption", categories: ["Drama"], description: "Chronicles the experiences of a formerly successful banker as
    a prisoner in the gloomy jailhouse of Shawshank after being found guilty of a crime he did not commit. The film
    portrays the man's unique way of dealing with his new, torturous life; along the way he befriends a number of
    fellow prisoners, most notably a wise long-term inmate named Red."},
  { title: " Schindler's List", categories: ["Biography", "Drama", "History"], description: "Oskar Schindler is a vain and greedy German businessman who becomes an
    unlikely humanitarian amid the barbaric German Nazi reign when he feels compelled to turn his factory into a refuge
    for Jews. Based on the true story of Oskar Schindler who managed to save about 1100 Jews from being gassed at the
    Auschwitz concentration camp, it is a testament to the good in all of us."},
  { title: "The Matrix", categories: ["Action", "Sci-Fi"], description: "Thomas A. Anderson is a man living two lives. By day he is an average computer
    programmer and by night a hacker known as Neo. Neo has always questioned his reality, but the truth is far beyond
    his imagination. Neo finds himself targeted by the police when he is contacted by Morpheus, a legendary computer
    hacker branded a terrorist by the government. As a rebel against the machines, Neo must confront the agents:
    super-powerful computer programs devoted to stopping Neo and the entire human rebellion."},
  { title: "Interstellar", categories: ["Adventure", "Drama", "Sci-Fi"], description: "Earth's future has been riddled by disasters, famines, and droughts. There is
    only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of
    our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right
    environment to sustain human life."},
  { title: "Joker", categories: ["Crime", "Drama", "Thriller"], description: "Arthur Fleck works as a clown and is an aspiring stand-up comic. He has mental health
    issues, part of which involves uncontrollable laughter. Times are tough and, due to his issues and occupation,
    Arthur has an even worse time than most. Over time these issues bear down on him, shaping his actions, making him
    ultimately take on the persona he is more known as...Joker."},
  { title: "Toy Story", categories: ["Animation", "Adventure", "Comedy", "Family", "Fantasy"], description: "A little boy named Andy loves to be in his room, playing with his toys, especially
    his doll named 'Woody'. But, what do the toys do when Andy is not with them, they come to life. Woody believes that
    his life (as a toy) is good. However, he must worry about Andy's family moving, and what Woody does not know is
    about Andy's birthday party. Woody does not realize that Andy's mother gave him an action figure known as Buzz
    Lightyear, who does not believe that he is a toy, and quickly becomes Andy's new favorite toy. Woody, who is now
    consumed with jealousy, tries to get rid of Buzz. Then, both Woody and Buzz are now lost. They must find a way to
    get back to Andy before he moves without them, but they will have to pass through a ruthless toy killer, Sid Phillips."},
  { title: " Inception", categories: ["Action", "Adventure", "Sci-Fi", "Thriller"], description: "Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction,
    stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable.
    Cobb's rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also
    made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption.
    One last job could give him his life back but only if he can accomplish the impossible, inception. Instead of the perfect heist,
    Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea, but to plant one. If they succeed,
    it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems
    to predict their every move. An enemy that only Cobb could have seen coming."},
  { title: "Back to the Future", categories: ["Adventure", "Comedy", "Sci-Fi"], description: "Marty McFly, a typical American teenager of the Eighties, is accidentally
    sent back to 1955 in a plutonium-powered DeLorean 'time machine' invented by a slightly mad scientist. During his often
    hysterical, always amazing trip back in time, Marty must make certain his teenage parents-to-be meet and fall in love -
    so he can get back to the future."},
  { title: "The Lion King", categories: ["Animation", "Adventure", "Drama", "Family"], description: "A young lion prince is cast out of his pride by his cruel uncle, who claims he
    killed his father. While the uncle rules with an iron paw, the prince grows up beyond the Savannah, living by a philosophy:
    No worries for the rest of your days. But when his past comes to haunt him, the young prince must decide his fate:
    Will he remain an outcast or face his demons and become what he needs to be?"},
  { title: "Intouchables", categories: ["Biography", "Comedy", "Drama"], description: "In Paris, the aristocratic and intellectual Philippe is a quadriplegic millionaire
    who is interviewing candidates for the position of his carer, with his red-haired secretary Magalie. Out of the blue,
    Driss cuts the line of candidates and brings a document from the Social Security and asks Phillipe to sign it to prove
    that he is seeking a job position so he can receive his unemployment benefit. Philippe challenges Driss, offering him a
    trial period of one month to gain experience helping him. Then Driss can decide whether he would like to stay with him or not.
    Driss accepts the challenge and moves to the mansion, changing the boring life of Phillipe and his employees."}
  ].each do |attr|
  puts attr
  movie = (Movie.find_by(title: attr[:title], description:  attr[:description]) || Movie.create(title: attr[:title], description:  attr[:description]))
  puts "movie with title #{attr[:title]} was cteated"

  attr[:categories].each do |category|
    category = Category.find_by(name: category) || Category.create(name: category)

    movie.categories << category unless movie.categories.include?(category)
    movie.save
  end
end


# add_categories = Movie.find(:title, :description).each{|category| category.add}
