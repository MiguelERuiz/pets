defmodule Template do
  use Pets
  pet "Bucky" do
    species :dog
    hobbies ["sniffing", "hunting birds"]
  end

  pet "Gardfield" do
    species :cat
    hobbies ["hating mondays"]
  end
end