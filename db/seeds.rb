# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = [
  ["Adam", "Andrews", "adam.andrews@example.com", "adam1234"],
  ["Brian", "Baskins", "brian.baskins@example.com", "brian1234"],
  ["Chloe", "Carter", "chloe.carter@example.com", "chloe1234"],
  ["Diana", "Dawson", "diana.dawson@example.com", "diana1234"],
  ["Ethan", "Ellis", "ethan.ellis@example.com", "ethan1234"],
  ["Fiona", "Foster", "fiona.foster@example.com", "fiona1234"],
  ["Grace", "Griffin", "grace.griffin@example.com", "grace1234"],
  ["Henry", "Hayes", "henry.hayes@example.com", "henry1234"],
  ["Isabella", "Irving", "isabella.irving@example.com", "isabella1234"],
  ["Jack", "Johnson", "jack.johnson@example.com", "jack1234"]
]

users.each do |fname, lname, email, password|
  User.find_or_create_by!(email: email) do |user|
    user.fname = fname
    user.lname = lname
    user.password = password
    user.is_admin = false
  end
end

categories = [
  "Philosophy",
  "Wisdom",
  "Life",
  "Courage",
  "Knowledge",
  "Personal Growth"
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end


sources = {}

sources[:shakespeare] = Source.find_or_create_by!(
  fname: "William",
  lname: "Shakespeare"
) do |source|
  source.dob = Date.new(1564, 1, 1)
  source.dod = Date.new(1616, 1, 1)
  source.bio = "English playwright and poet, author of Hamlet."
end

sources[:emerson] = Source.find_or_create_by!(
  fname: "Ralph Waldo",
  lname: "Emerson"
) do |source|
  source.dob = Date.new(1803, 5, 25)
  source.dod = Date.new(1882, 4, 27)
  source.bio = "American essayist, lecturer and philosopher."
end

sources[:douglass] = Source.find_or_create_by!(
  fname: "Frederick",
  lname: "Douglass"
) do |source|
  source.dob = Date.new(1818, 2, 14)
  source.dod = Date.new(1895, 2, 20)
  source.bio = "American abolitionist, writer and public speaker."
end

sources[:whitman] = Source.find_or_create_by!(
  fname: "Walt",
  lname: "Whitman"
) do |source|
  source.dob = Date.new(1819, 5, 31)
  source.dod = Date.new(1892, 3, 26)
  source.bio = "American poet, author of Leaves of Grass."
end

sources[:austen] = Source.find_or_create_by!(
  fname: "Jane",
  lname: "Austen"
) do |source|
  source.dob = Date.new(1775, 12, 16)
  source.dod = Date.new(1817, 7, 18)
  source.bio = "English novelist known for Pride and Prejudice and Emma."
end

sources[:seneca] = Source.find_or_create_by!(
  fname: "Lucius Annaeus",
  lname: "Seneca"
) do |source|
  # Exact birth date is uncertain.
  source.dob = nil
  source.dod = Date.new(65, 1, 1)
  source.bio = "Roman Stoic philosopher and writer."
end


quotes = [
  {
    user_id: 1,
    source: :shakespeare,
    text: "There is nothing either good or bad, but thinking makes it so.",
    pub_year: 1600,
    categories: ["Philosophy", "Wisdom"]
  },
  {
    user_id: 2,
    source: :shakespeare,
    text: "There are more things in heaven and earth, Horatio, than are dreamt of in your philosophy.",
    pub_year: 1600,
    categories: ["Knowledge", "Philosophy"]
  },
  {
    user_id: 3,
    source: :emerson,
    text: "Whoso would be a man must be a nonconformist.",
    pub_year: 1841,
    categories: ["Courage", "Personal Growth"]
  },
  {
    user_id: 4,
    source: :emerson,
    text: "Nothing is at last sacred but the integrity of your own mind.",
    pub_year: 1841,
    categories: ["Wisdom", "Personal Growth"]
  },
  {
    user_id: 5,
    source: :douglass,
    text: "If there is no struggle, there is no progress.",
    pub_year: 1857,
    categories: ["Courage", "Life"]
  },
  {
    user_id: 6,
    source: :douglass,
    text: "Power concedes nothing without a demand. It never did and it never will.",
    pub_year: 1857,
    categories: ["Courage", "Philosophy"]
  },
  {
    user_id: 7,
    source: :whitman,
    text: "Do I contradict myself? Very well then I contradict myself, (I am large, I contain multitudes.)",
    pub_year: 1855,
    categories: ["Life", "Personal Growth"]
  },
  {
    user_id: 8,
    source: :whitman,
    text: "I bequeath myself to the dirt to grow from the grass I love.",
    pub_year: 1855,
    categories: ["Life", "Wisdom"]
  },
  {
    user_id: 9,
    source: :austen,
    text: "There is no charm equal to tenderness of heart.",
    pub_year: 1815,
    categories: ["Personal Growth", "Wisdom"]
  },
  {
    user_id: 10,
    source: :austen,
    text: "Know your own happiness. You want nothing but patience, or give it a more fascinating name, call it hope.",
    pub_year: 1811,
    categories: ["Personal Growth", "Happiness"]
  },
  {
    user_id: 11,
    source: :seneca,
    text: "We suffer more often in imagination than in reality.",
    pub_year: nil,
    categories: ["Philosophy", "Wisdom"]
  }
]

quotes.each do |data|
  quote = Quote.find_or_initialize_by(text: data[:text])

  quote.user = User.find(data[:user_id])
  quote.source = sources.fetch(data[:source])
  quote.pub_year = Date.new(data[:pub_year], 1, 1) if data[:pub_year]

  quote.save!

  data[:categories].each do |category_name|
    category = Category.find_by!(name: category_name)
    quote.categories << category unless quote.categories.exists?(id: category.id)
  end
end
