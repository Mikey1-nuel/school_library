require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../person'

describe 'Decorators' do
  before :all do
    @person = Person.new(22, 'maximilianus')
  end
end
