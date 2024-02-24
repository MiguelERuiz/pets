defmodule Template do
  import Pets.Pet

  pet "Bucky" do
    species :dog
    hobbies ["sniffing", "eating birds"]
  end

  # pet "Atila" do
  #   hobbies ["napping"]
  # end

  # pet "Godzilla" do
  #   hobbies ["destroying Tokio"]
  # end
end