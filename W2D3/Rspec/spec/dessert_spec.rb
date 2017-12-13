require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements
without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Archibald") }
  let(:snickerdoodle) { Dessert.new("snickerdoodle", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(snickerdoodle.type).to eq('snickerdoodle')
    end

    it "sets a quantity" do
      expect(snickerdoodle.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(snickerdoodle.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("snickerdoodle", "ate", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      snickerdoodle.add_ingredient("rutabega")
      expect(snickerdoodle.ingredients).to include("rutabega")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["eggs", "sardines", "mock turtle"]
      ingredients.each do |val|
      snickerdoodle.add_ingredient(val)
    end

      expect(snickerdoodle.ingredients).to eq(ingredients)
      snickerdoodle.mix!
      expect(snickerdoodle.ingredients).not_to eq(ingredients)
      expect(snickerdoodle.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(snickerdoodle.eat(5)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { snickerdoodle.eat(27) }.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Archbibald the Great Baker")
      expect(snickerdoodle.serve).to eq("Chef Archbibald the Great Baker has made 10 snickerdoodles!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(snickerdoodle)
      snickerdoodle.make_more
    end
  end
end
