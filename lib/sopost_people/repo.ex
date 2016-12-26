defmodule SopostPeople.Repo do
  use Ecto.Repo, otp_app: :sopost_people

  def all(SopostPeople.Person) do
    [%SopostPeople.Person{id: 0, name: "Bianca Chambers", title: "Account Manager", locations: "London", avatar: "https://trello-avatars.s3.amazonaws.com/db8ffd76b7f7779573c31d420112fde6/170.png"},
     %SopostPeople.Person{id: 1, name: "David Ingledow", title: "Platform UX" locations: "Newcastle" avatar: "https://trello-avatars.s3.amazonaws.com/af43adece56839427601ac1dfaa3753b/170.png"},
     %SopostPeople.Person{id: 2, name: "David Jeffrey", title: "Platform Programmer", locations: "Newcastle" avatar: "https://trello-avatars.s3.amazonaws.com/d9d92e53fe6d9e112cab6e76bda672e1/170.png"}
     %SopostPeople.Person{id: 3, name: "Jamie Curle", title: "CTO", locations: "Newcastle", avatar: "https://trello-avatars.s3.amazonaws.com/070e6904df5e3ac37140c448933f8a30/170.png"}
     %SopostPeople.Person{id: 4, name: "Jonathan Grubin", title: "CEO", locations: "Newcastle, London, New York", avatar: "https://trello-avatars.s3.amazonaws.com/f8be96ef98e2dfe05e5280010140d369/170.png"}
     %SopostPeople.Person{id: 5, name: "Lesley Fraser", title: "Customer Service", locations: "Newcastle", avatar: "https://trello-avatars.s3.amazonaws.com/c4ec031aff7260d506e177104586810e/170.png"}
     %SopostPeople.Person{id: 6, name: "Liz Keane", title: "Commercial Director", locations: "London", avatar: "https://trello-avatars.s3.amazonaws.com/7600996b3199cdb6971605d3d98b502e/170.png"}
     %SopostPeople.Person{id: 7, name: "Mia Clayton", title: "Account Manager", locations: "London", avatar: "https://trello-avatars.s3.amazonaws.com/45a336c29ba54c4098fb2e0aaf4541b3/30.png"}
     %SopostPeople.Person{id: 8, name: "Morgan Thompson-Murdoch", title: "Account Manager", locations: "London", avatar: "https://trello-avatars.s3.amazonaws.com/cab953a1051d80bfb68f218eb2f01752/170.png"}
     %SopostPeople.Person{id: 9, name: "Sam Hopper", title: "Platform Programmer" locations: "Newcastle", avatar: "https://avatars2.githubusercontent.com/u/3852682?v=3&s=170"}
     %SopostPeople.Person{id: 10, name: "Phil Jeffes", title: "Platform Devops", locations: "Newcastle", avatar: "https://avatars3.githubusercontent.com/u/1382988?v=3&s=170"}
     %SopostPeople.Person{id: 11, name: "Tamzin Ward", title: "Head of Delivery", locations: "Newcastle", avatar: "https://avatars3.githubusercontent.com/u/14310616?v=3&s=170"}
     %SopostPeople.Person{id: 12, name: "Alex Parkinson", title: "Sales", locations: "London", avatar: "https://media.licdn.com/media/AAEAAQAAAAAAAAjKAAAAJDQ1OTU1OWE4LWNmN2UtNDE2Yy05NDliLTAwOTJjZjcyNzQ2Mg.jpg"}
    ]
  end
end
