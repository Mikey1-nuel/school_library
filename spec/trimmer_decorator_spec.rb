require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../person'

describe 'Decorators' do
  before :all do
    @person = Person.new(22, 'maximilianus')
  end

  describe '#trimmer_decorator' do
    it 'returns a name trimmed to 10 characters long if was initially longer' do
      trimmed_person = TrimmerDecorator.new(@person)
      expect(trimmed_person.correct_name).to eq 'maximilian'
    end
  end

  describe '#trimmer_decorator' do
    it 'returns a name trimmed to 10 characters long if was initially longer' do
      capitalized_person = CapitalizeDecorator.new(@person)
      trimmed_person = TrimmerDecorator.new(capitalized_person)
      expect(trimmed_person.correct_name).to eq 'Maximilian'
    end
  end
end
