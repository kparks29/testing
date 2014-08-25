require 'rails_helper'

describe 'Athlete' do
  
  before :each do
    @valid_attributes = {
      first_name: "Joe",
      last_name: "Knox",
      middle_name: "",
      age: 26,
      sport: "Ping Pong",
      country: "USA",
      drug_free: true
    }
  end

  describe 'when all attributes are valid' do
    it 'is valid' do
      athlete = Athlete.new(@valid_attributes)
      expect(athlete).to be_valid
    end
  end

  describe 'validations: ' do

    context 'when first name is missing' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(first_name: nil))
        expect(athlete).not_to be_valid
      end
    end

    context 'when last name is missing' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(last_name: nil))
        expect(athlete).not_to be_valid
      end
    end

    context 'when last name is less than two characters in length' do
      it 'is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(last_name: "L"))
        expect(athlete).not_to be_valid
      end
    end

    context 'when country is missing' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(country: nil))
        expect(athlete).not_to be_valid
      end
    end

    context 'when age is missing' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(age: nil))
        expect(athlete).not_to be_valid
      end
    end

    context 'when age is not an integer' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(age: "a2"))
        expect(athlete).not_to be_valid
      end
    end

    context 'when age is less than 18' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(age: 17))
        expect(athlete).not_to be_valid
      end
    end

    context 'when drug free is less missing' do
      it 'it is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(drug_free: nil))
        expect(athlete).not_to be_valid
      end
    end

    context 'when drug free is not a boolean' do
      it 'is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(drug_free: nil))
        expect(athlete).not_to be_valid
      end
    end

    context 'when drug free is not true' do
      it 'is not valid' do
        athlete = Athlete.new(@valid_attributes.merge(drug_free: false))
        expect(athlete).not_to be_valid
      end
    end

  end

end
