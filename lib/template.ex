defmodule Template do
  import Pets.Pet
  pet "Bucky" do
    species :dog
    hobbies ["sniffing", "hunting birds"]
  end

  pet "Gardfield" do
    species :cat
    hobbies ["hating mondays"]
  end
end