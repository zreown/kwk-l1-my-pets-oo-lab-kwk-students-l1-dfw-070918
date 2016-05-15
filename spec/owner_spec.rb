require_relative 'spec_helper.rb'

describe Owner do
  # before(:each) do
  #   Owner.reset_all
  # end

  let(:owner) { Owner.new("human") }
  let(:fish) { Fish.new("Nemo") }
  let(:cat) { Cat.new("Crookshanks") }
  let(:dog) { Dog.new("Fido") }  


  it "can initialize an owner" do
    expect(owner).to be_a(Owner)
  end

  it "initializes with a species" do
    expect(owner.species).to eq("human")
  end

  it "can't change its species" do 
    expect { owner.species = "hamster" }.to raise_error
  end

  it "can say its species" do 
    expect(owner.say_species).to eq("I am a human.")
  end 

  it "can have a name" do
    owner.name = "Katie"
    expect(owner.name).to eq("Katie")
  end

  it "is initialized with a pets attribute as a hash with 3 keys" do
    expect(owner.pets).to eq({:fishes => [], :dogs => [], :cats => []})
  end

  it 'can buy a fish' do 
    expect(owner.pets[:fishes].count).to eq(0)
    owner.buy_fish("Bubbles")
    expect(owner.pets[:fishes].count).to eq(1)
  end

  it 'can buy a cat' do 
    expect(owner.pets[:cats].count).to eq(0)
    owner.buy_cat("Crookshanks")
    expect(owner.pets[:cats].count).to eq(1)
  end

  it 'can buy a dog' do
    expect(owner.pets[:dogs].count).to eq(0)
    owner.buy_dog("Snuffles")
    expect(owner.pets[:dogs].count).to eq(1)
  end

  it 'knows about its fishes' do
    owner.buy_fish("Bubbles")
    expect(owner.pets[:fishes][0]).to eq("Bubbles")
  end

  it 'knows about its cats' do 
    owner.buy_cat("Crookshanks")
    expect(owner.pets[:cats][0]).to eq("Crookshanks")
  end

  it 'knows about its dogs' do
    owner.buy_dog("Snuffles")
    expect(owner.pets[:dogs][0]).to eq("Snuffles") 
  end

  it 'can list off its pets' do 
    owner.buy_fish("Bubbles")
    owner.buy_fish("Nemo")
    owner.buy_cat("Crookshanks")
    owner.buy_dog("Fido")
    owner.buy_dog("Snuffles")
    owner.buy_dog("Charley")
    expect(owner.list_pets).to eq("I have 2 fish, 3 dog(s), and 1 cat(s).")
  end

end