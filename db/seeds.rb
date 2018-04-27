Genre.create({ name: "Science" })
Genre.create({ name: "Children's" })
Genre.create({ name: "Maritime" })
Genre.create({ name: "Natural History" })
Genre.create({ name: "Modern" })
Genre.create({ name: "Memorial" })


Museum.create(name:"Heritage Museums and Gardens", location:"67 Grove Street, Sandwich, MA 02563", description:"Engaging Exhibit and 100 acres of gardens and nature trails", founding_date:"01/03/2010", url: "https://heritagemuseumsandgardens.org/")
Museum.create(name:"Boston Children's Museum", location: "308 Congress St., Boston, MA 02210",description:"Boston Children’s Museum is the second oldest, and one of the most influential children’s museums in the world.", founding_date:"01/01/1913", url: "http://www.bostonchildrensmuseum.org/")
Museum.create(name:"Museum of Fine Arts", location:"465 Huntington Avenue, Boston, MA 02115", description:"The MFA is one of the most comprehensive art museums in the world; the collection encompasses nearly 450,000 works of art.", founding_date:"07/04/1876", url: "http://www.mfa.org/")

MuseumGenre.create(museum_id: 1, genre_id: 1)
MuseumGenre.create(museum_id: 1, genre_id: 2)
MuseumGenre.create(museum_id: 1, genre_id: 3)
MuseumGenre.create(museum_id: 2, genre_id: 1)
MuseumGenre.create(museum_id: 2, genre_id: 2)
