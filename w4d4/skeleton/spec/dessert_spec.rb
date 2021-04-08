require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:gelato) { Dessert.new('gelato', 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(gelato.type).to eq('gelato')
    end
    it "sets a quantity" do
      expect(gelato.quantity).to eq(10)
    end


    it "starts ingredients as an empty array" do
      expect(gelato.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new('gelato', 'not an integer', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      gelato.add_ingredient('pistachio')
      expect(gelato.ingredients).to include('pistachio')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['vanilla', 'strawberry', 'chocolate']

      ingredients.each do |ingredient|
        gelato.add_ingredient(ingredient)
      end

      expect(gelato.ingredients).to eq(ingredients)
      gelato.mix!
      expect(gelato.ingredients).not_to eq(ingredients)
      expect(gelato.ingredients.sort).to eq(ingredients.sort)

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      gelato.eat(5)
      expect(gelato.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ gelato.eat(100)}.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Tucker the Great Baker')
      expect(gelato.serve).to eq('Chef Tucker the Great Baker has made 10 gelatos!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(gelato)
      gelato.make_more
    end
  end
end
