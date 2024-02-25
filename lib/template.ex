defmodule Template do
  import Pets.Pet

  pet "Bucky" do
    species :dog
    hobbies ["sniffing", "eating birds"]
  end

  pet "Gardfield" do
    species :cat
    hobbies ["hating mondays"]
  end

  pet "Godzilla" do
    species :lizard
    hobbies ["destroying Tokio"]
  end
end