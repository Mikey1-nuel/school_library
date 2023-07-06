require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../person'

describe 'Decorators' do
  before :all do
    @person = Person.new(22, 'maximilianus')
  end

  describe '#capitalize_decorator' do
    it 'returns a capitalized name' do
      capitalized_person = CapitalizeDecorator.new(@person)
      expect(capitalized_person.correct_name).to eq 'Maximilianus'
    end
  end
end
