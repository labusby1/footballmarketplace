class Club < ActiveRecord::Base
  has_and_belongs_to_many :leagues
  belongs_to :possession
  has_many :players
  has_one :manager
  
  def makeSymbol
    #Convention will dictate that clubs symbols should be three characters long
    #Players and managers will have symbols 4 characters long, as long as that's possible
    @name = self.name
    @symbol = ''
    
    if @name.split(' ').length > 1 
      #Club name is multiple words
      #Make an array of the clubs name and remove any instances of 'and'
      nameArr = @name.split(' ').delete_if{|a| a == 'and'}
      nameArrLen  = nameArr.length
      
      #If nameArr is exactly 3 elements than each symbol character will be first letter of each word in the name
      #Example name = "Brighton and Hove Albion" means nameArr = ["Brighton", "Hove", "Albion"] means symbol = "BHA"
      if nameArrLen < 3
        @symbol += nameArr[0][0].upcase
        @symbol += nameArr[1][0].upcase
        @symbol += nameArr[1][1].upcase
      else
        #For the first three words in the name, we take the first letter and capitalize
        nameArr.each do |word|
          @symbol += word.first.upcase
        end
        @symbol = @symbol[0..2]
      end
      
    else
      #Club name is one word long
      lgth = @name.length
      if lgth > 3
        #So take the first four characters and capilize them and that becomes the symbol
        @symbol = @name.slice(0,3).upcase
      else
        #If the length of the name is greater than four we just take the legnth of the name worth of characters to make the 
        # symbol. I expect this case will never be met but just in case...
        @symbol = @name.slice(0,lgth).upcase
      end
    end
    
    #compare symbol result to all stocks to make sure it doesn't already exist
    def checkAvailable(sym)
      alph = ("a".."z").to_a
      alph = alph.sort! {|x,y| y <=> x }
      i = 0
      while Stock.exists?(symbol: sym) do 
        sym[2] = alph[i].upcase
        i += 1
      end
      return sym
    end
    
    @symbol = checkAvailable(@symbol)
    return @symbol
  end
  
  
end