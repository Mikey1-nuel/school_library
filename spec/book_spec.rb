require_relative '../book'
require_relative '../person'

describe Book do
  before :all do
    @book = Book.new 'Health of the sick', 'Jesse Luis'
  end

  describe 'creating a Book object' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_instance_of Book
    end
  end

  describe '.title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'Health of the sick'
    end
  end

  describe '.author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Jesse Luis'
    end
  end

  describe '.rentals' do
    it 'has a rentals array' do
      expect(@book).to have_attributes(rentals: [])
    end
  end

  describe '#add_rental method' do
    it 'creates a rental object' do
      person = Person.new(24, 'Jayden')
      rental = @book.add_rental(person, '2020/08/03')
      expect(rental).to be_instance_of Rental
    end
  end
end