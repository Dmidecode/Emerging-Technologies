require "test/unit"

class MyRational
	attr_accessor :num, :den

	 def initialize(num = 0, den = 1)
	 	divNum = gcd(num, den)
	 	@num = num / divNum
	 	@den = den / divNum
	 end

	 def to_s()
	 	@num.to_s + "/" + @den.to_s
	 end

	 def add(paramRational)
		newRational = MyRational.new
	 	newRational.den = @den * paramRational.den
	 	newRational.num = (@num * paramRational.den) + (@den * paramRational.num)
		newRational
	 end

	 def substract(paramRational)
	 	newRational = MyRational.new
	 	newRational.den = @den * paramRational.den
	 	newRational.num = (@num * paramRational.den) - (@den * paramRational.num)
		newRational
	 end

	 def multiply(paramRational)
	 	newRational = MyRational.new
	 	newRational.den = @den * paramRational.den
	 	newRational.num = (@num * paramRational.num)
		newRational
	 end

	def divide(paramRational)
	 	newRational = MyRational.new
	 	newRational.den = @den * paramRational.num
	 	newRational.num = (@num * paramRational.den)	 	
		newRational
	 end

	 def actual_value
	 	@num.to_f / @den.to_f
	 end

	def gcd(a, b)

		if (b == 0)
        	a
	    else
    	    gcd(b, a % b)
	    end
	end
end

def factorial(x)
	if x == 1 || x == 0
		1
	else
		x * factorial(x - 1)
	end
end

def puissance(x, n)  
    res = 1.0;
    i = 0
    while i < n do
        res *= x
        i += 1
    end
	res
end

def expo(x, range)  
    res = 0
    i = 0
    while i < range do 
	    compute = MyRational.new(puissance(x, i), factorial(i))
        res +=  compute.actual_value
        i += 1
    end
    res
end

class MyComplex

	attr_accessor :real, :imaginary

	def initialize(realDefaut = 0, imaginaryDefaut = 0)
		@real = realDefaut;
		@imaginary = imaginaryDefaut;
	end

	def to_s
		if (@imaginary >= 0)
	 		(@real.to_s + "+" + @imaginary.to_s + "i")
	 	else
	 		(@real.to_s + @imaginary.to_s + "i")
	 	end
	 end

	 def add(complex)
	 	newComplex = MyComplex.new
	 	newComplex.real = @real + complex.real
	 	newComplex.imaginary = @imaginary + complex.imaginary
		newComplex
	 end

	 def substract(complex)
	 	newComplex = MyComplex.new
	 	newComplex.real = @real - complex.real
	 	newComplex.imaginary = @imaginary - complex.imaginary
		newComplex
	 end

	  def multiply(complex)
	 	newComplex = MyComplex.new
	 	newComplex.real = (@real * complex.real) - (@imaginary * complex.imaginary)
	 	newComplex.imaginary = (@real * complex.imaginary) + (@imaginary * complex.real)
		newComplex
	 end

	 def conjugate
	 	newComplex = MyComplex.new
	 	newComplex.real = @real
	 	newComplex.imaginary = @imaginary * -1
	 	newComplex
	 end

end

class Album
	attr_accessor :artist, :title, :year_released

	def initialize(tabAlbum)
		@artist = tabAlbum[:artist]
		@title = tabAlbum[:title]
		@year_released = tabAlbum[:year]
	end

	def to_s
		@artist + "'s album : '" + @title + "' came out in " + @year_released.to_s
	end

end

def findOldestAlbum(arrayAlbum)
	resAlbum = arrayAlbum.first

	arrayAlbum.each do |album|
		if resAlbum.year_released > album.year_released
			resAlbum = album
		end
	end
	resAlbum
end

def findYoungestAlbum(arrayAlbum)
	resAlbum = arrayAlbum.first

	arrayAlbum.each do |album|
		if resAlbum.year_released < album.year_released
			resAlbum = album
		end
	end
	resAlbum
end

def findSameArtist(arrayAlbum, artist)
	resNumber = 0

	arrayAlbum.each do |album|
		if album.artist == artist
			resNumber += 1
		end
	end
	resNumber
end



class TestMyProgram < Test::Unit::TestCase

	print "/////////////////   MyRational Test   /////////////////////\n\n" 

	firstRational = MyRational.new(24, 8)
	secondRational = MyRational.new(126, 42)

	puts "Gcd(24, 8) = " + firstRational.gcd(24, 8).to_s + " - Gcd(126, 42) = " + secondRational.gcd(126, 42).to_s

	puts "FirstRational.to_s = " + firstRational.to_s + " - SecondRational.to_s = " + secondRational.to_s

	add_result = firstRational.add(secondRational)
	sub_result = firstRational.substract(secondRational)
	mult_result = firstRational.multiply(secondRational)
	div_result = firstRational.divide(secondRational)

	puts firstRational.to_s + " + " + secondRational.to_s + " = " + add_result.to_s + " --> " + add_result.actual_value.to_s
	puts firstRational.to_s + " - " + secondRational.to_s + " = " + sub_result.to_s + " --> " + sub_result.actual_value.to_s
	puts firstRational.to_s + " * " + secondRational.to_s + " = " + mult_result.to_s + " --> " + mult_result.actual_value.to_s
	print firstRational.to_s + " / " + secondRational.to_s + " = " + div_result.to_s + " --> " + div_result.actual_value.to_s + "\n\n"

	print "///////////////////////////////////////////////////////////\n\n"

	print "//////////////////// Factoriel Test ///////////////////////\n\n"

	puts "Factorial(5) = " + factorial(5).to_s
	puts "Factorial(10) = " + factorial(10).to_s

	print "\n///////////////////////////////////////////////////////////\n\n"

	print "/////////////////////  Taylor Test  ////////////////////////\n\n"

	puts expo(2, 20).to_s

	print "\n///////////////////////////////////////////////////////////\n\n"

	print "////////////////////  MyComplex Test  /////////////////////\n\n"

	firstComplex = MyComplex.new 3, 6
	secondComplex = MyComplex.new 5, 4

	puts "FirstComplex.to_s = " + firstComplex.to_s + " - SecondComplex.to_s = " + secondComplex.to_s

	addComplex_result = firstComplex.add(secondComplex)
	subComplex_result = firstComplex.substract(secondComplex)
	multComplex_result = firstComplex.multiply(secondComplex)

	puts firstComplex.to_s + " + " + secondComplex.to_s + " = " + addComplex_result.to_s
	puts firstComplex.to_s + " - " + secondComplex.to_s + " = " + subComplex_result.to_s
	print firstComplex.to_s + " * " + secondComplex.to_s + " = " + multComplex_result.to_s + "\n\n"

	secondComplex = secondComplex.conjugate
	puts secondComplex.to_s
	secondComplex = secondComplex.conjugate
	puts secondComplex.to_s

	print "\n///////////////////////////////////////////////////////////\n\n"


	print "/////////////////   Album Test   //////////////////////////\n\n"

	tabAlbum = { :artist => "Bee Gees", :title => "Staying Alive !", :year => 1980}
	tabAlbum2 = { :artist => "Mozart", :title => "Piano Mezzo", :year => 1792}
	tabAlbum3 = { :artist => "Kanye West", :title => "StickFish", :year => 2012}
	tabAlbum4 = { :artist => "Bee Gees", :title => "Boogie Neight", :year => 1985}
	tabAlbum5 = { :artist => "Bee Gees", :title => "Disco Club", :year => 1985}

	album = Album.new(tabAlbum)
	album2 = Album.new(tabAlbum2)
	album3 = Album.new(tabAlbum3)
	album4 = Album.new(tabAlbum4)
	album5 = Album.new(tabAlbum5)

	arrayAlbum = [ album, album2, album3, album4, album5 ]		 # =>  Store the five albums

	puts album.to_s
	puts album2.to_s
	puts album3.to_s
	puts album4.to_s
	puts album5.to_s

	print "\nThe Oldest Album is: " + findOldestAlbum(arrayAlbum).to_s	 # =>  function which find the oldest album
	print "\nThe Youngest Album is: " + findYoungestAlbum(arrayAlbum).to_s 	# =>  function which find the youngest album

	sameArtist = findSameArtist(arrayAlbum, "Bee Gees")		 # =>  function which recuperate the number of albums which have the same artist as the parameter artist
	print "\n\n" + sameArtist.to_s + " albums have the same artist : Bee Gees\n"

	print "\n\n///////////////////////////////////////////////////////////\n"	
end
