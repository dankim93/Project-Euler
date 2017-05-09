############################
#Name: Dong Kyun Kim 		   #
############################

#############
# Euler #1  #--------------------------------------------------------------
#############
def mult_3_5()
	total = 0
	(1...1000).each do |n|
		if n % 3 == 0 || n % 5 == 0
			total += n
		end
	end
	total
end
p mult_3_5

#############
# Euler #2  #--------------------------------------------------------------
#############
def even_fib_num()
	total = 0
	array = [1,2]
	while array[-1] < 4000000
		array << array[-1] + array[-2]
	end

	array.each {|n| total += n if n.even?}
	total
end
p even_fib_num


#############
# Euler #3  #--------------------------------------------------------------
#############
def largest_prime_factor(n)
	factor = 2
	while factor * factor <= n
		if n % factor == 0
			n = n / factor
		else
			factor += 1
		end
	end
	n
end
p largest_prime_factor(600851475143)

#############
# Euler #4  #--------------------------------------------------------------
#############
def largest_palindrome_product()
	answer = []
	temp = ""
	for i in 100..999
		for j in 100..999
			temp = i*j
			if temp.to_s == temp.to_s.reverse
				answer << temp
			end
		end
	end
	answer.max
end
p largest_palindrome_product

#############
# Euler #5  #--------------------------------------------------------------
#############
def smallest_multiple()
	number = 20

	while true
		if (2..20).all? {|n| number % n == 0}		#also takes too long ~ 40sec
			return number
		end
		number += 2
	end
end
p smallest_multiple

#############
# Euler #6  #--------------------------------------------------------------
#############
def sum_square_diff()
	sum_square = (1..100).reduce {|sum, n| sum + n**2}
	square_sum = (1..100).reduce {|sum, n| sum + n}**2

	square_sum - sum_square
end
p sum_square_diff

#############
# Euler #7  #--------------------------------------------------------------
#############
def st_prime()
	count = 0
	number = 2
	while count < 10001
		count += 1 if (2..Math.sqrt(number)).none? {|n| number % n == 0}
		number += 1
	end
	number - 1
end


p st_prime

#############
# Euler #8  #--------------------------------------------------------------
#############
def largest_product_series()
	number = <<EOS
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
EOS
	number = number.split.join

	current = 0

	number.each_char.with_index do |n,j|
		if j < number.length - 13
			#x = (number[j].to_i..number[j+12].to_i).reduce {|mult, m| mult *= m}
			x = 1
			for count in j..j+12
				x = number[count].to_i * x
			end
			if x > current
				current = x
				x = 1
			end
		end
	end
	current
end
p largest_product_series()

#############
# Euler #9  #--------------------------------------------------------------
#############
def pythagorean_triplet()

	for a in 0..1000
		for b in 0..1000
			for c in 0..1000
				if a**2 + b**2 - c**2 == 0 && a+b+c == 1000 && a < b && b < c
					return a*b*c
				end
			end
		end
	end
end
p pythagorean_triplet

#############
# Euler #10 #--------------------------------------------------------------
#############
def isprime?(number)
	for i in 3..Math.sqrt(number)
		if number % i == 0
			return false
		end
	end
	true
end

def sum_of_primes()
	sum = 2
	n = 2000000
	for i in 3.step(n,2)
		if isprime?(i)							#takes ~15sec
			sum += i
		end
	end
	sum
end
p sum_of_primes

#############
# Euler #11 #--------------------------------------------------------------
#############
def largest_product_grid()
	array = []
	numbers =
	"08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
	49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
	81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
	52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
	22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
	24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
	32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
	67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
	24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
	21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
	78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
	16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
	86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
	19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
	04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
	88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
	04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
	20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
	20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
	01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48"
	bucket = []
	max = 0
	numbers = numbers.split

	numbers.each do |n|
		bucket << n.to_i
		if bucket.length == 20
			array << bucket
			bucket = []
		end

	end

	#horizontal
	for i in 0..19
		for j in 0..16
			product = array[i][j]* array[i][j+1]*array[i][j+2]*array[i][j+3]
			max = product if product > max
		end
	end

	#vertical
	for i in 0..16
		for j in 0..19
			product = array[i][j]* array[i+1][j] *array[i+2][j]* array[i+3][j]
			max = product if product > max
		end
	end

	#diag \
	for i in 0..16
		for j in 0..16
			product = array[i][j]* array[i+1][j+1]*array[i+2][j+2]*array[i+3][j+3]
			max = product if product > max
		end
	end
	#diag /
	for i in 0..16
		for j in 3..19
			product = array[i][j]* array[i+1][j-1]* array[i+2][j-2]* array[i+3][j-3]
			max = product if product > max
		end
	end
	max
end
p largest_product_grid()

#############
# Euler #12 #--------------------------------------------------------------
#############
def factors_count(n)
	count = 1
	for i in 2..Math.sqrt(n)
		exponent = 0
		while n % i == 0
			exponent += 1
			n /= i
		end
		count *= (exponent + 1)
	end
	count
end

def highly_divisible_triangular_number()

	number = 2
	triangular = [1]
	while true
		#triangular << (1..triangular.length+1).reduce {|sum,n| sum + n}
		triangular << number*(number+1)/2
		number += 1

		if factors_count(triangular[-1]) > 500
			return triangular[-1]
		end
	end
end

p highly_divisible_triangular_number

#############
# Euler #13 #--------------------------------------------------------------
#############
def large_sum()
	number =
"37107287533902102798797998220837590246510135740250
46376937677490009712648124896970078050417018260538
74324986199524741059474233309513058123726617309629
91942213363574161572522430563301811072406154908250
23067588207539346171171980310421047513778063246676
89261670696623633820136378418383684178734361726757
28112879812849979408065481931592621691275889832738
44274228917432520321923589422876796487670272189318
47451445736001306439091167216856844588711603153276
70386486105843025439939619828917593665686757934951
62176457141856560629502157223196586755079324193331
64906352462741904929101432445813822663347944758178
92575867718337217661963751590579239728245598838407
58203565325359399008402633568948830189458628227828
80181199384826282014278194139940567587151170094390
35398664372827112653829987240784473053190104293586
86515506006295864861532075273371959191420517255829
71693888707715466499115593487603532921714970056938
54370070576826684624621495650076471787294438377604
53282654108756828443191190634694037855217779295145
36123272525000296071075082563815656710885258350721
45876576172410976447339110607218265236877223636045
17423706905851860660448207621209813287860733969412
81142660418086830619328460811191061556940512689692
51934325451728388641918047049293215058642563049483
62467221648435076201727918039944693004732956340691
15732444386908125794514089057706229429197107928209
55037687525678773091862540744969844508330393682126
18336384825330154686196124348767681297534375946515
80386287592878490201521685554828717201219257766954
78182833757993103614740356856449095527097864797581
16726320100436897842553539920931837441497806860984
48403098129077791799088218795327364475675590848030
87086987551392711854517078544161852424320693150332
59959406895756536782107074926966537676326235447210
69793950679652694742597709739166693763042633987085
41052684708299085211399427365734116182760315001271
65378607361501080857009149939512557028198746004375
35829035317434717326932123578154982629742552737307
94953759765105305946966067683156574377167401875275
88902802571733229619176668713819931811048770190271
25267680276078003013678680992525463401061632866526
36270218540497705585629946580636237993140746255962
24074486908231174977792365466257246923322810917141
91430288197103288597806669760892938638285025333403
34413065578016127815921815005561868836468420090470
23053081172816430487623791969842487255036638784583
11487696932154902810424020138335124462181441773470
63783299490636259666498587618221225225512486764533
67720186971698544312419572409913959008952310058822
95548255300263520781532296796249481641953868218774
76085327132285723110424803456124867697064507995236
37774242535411291684276865538926205024910326572967
23701913275725675285653248258265463092207058596522
29798860272258331913126375147341994889534765745501
18495701454879288984856827726077713721403798879715
38298203783031473527721580348144513491373226651381
34829543829199918180278916522431027392251122869539
40957953066405232632538044100059654939159879593635
29746152185502371307642255121183693803580388584903
41698116222072977186158236678424689157993532961922
62467957194401269043877107275048102390895523597457
23189706772547915061505504953922979530901129967519
86188088225875314529584099251203829009407770775672
11306739708304724483816533873502340845647058077308
82959174767140363198008187129011875491310547126581
97623331044818386269515456334926366572897563400500
42846280183517070527831839425882145521227251250327
55121603546981200581762165212827652751691296897789
32238195734329339946437501907836945765883352399886
75506164965184775180738168837861091527357929701337
62177842752192623401942399639168044983993173312731
32924185707147349566916674687634660915035914677504
99518671430235219628894890102423325116913619626622
73267460800591547471830798392868535206946944540724
76841822524674417161514036427982273348055556214818
97142617910342598647204516893989422179826088076852
87783646182799346313767754307809363333018982642090
10848802521674670883215120185883543223812876952786
71329612474782464538636993009049310363619763878039
62184073572399794223406235393808339651327408011116
66627891981488087797941876876144230030984490851411
60661826293682836764744779239180335110989069790714
85786944089552990653640447425576083659976645795096
66024396409905389607120198219976047599490197230297
64913982680032973156037120041377903785566085089252
16730939319872750275468906903707539413042652315011
94809377245048795150954100921645863754710598436791
78639167021187492431995700641917969777599028300699
15368713711936614952811305876380278410754449733078
40789923115535562561142322423255033685442488917353
44889911501440648020369068063960672322193204149535
41503128880339536053299340368006977710650566631954
81234880673210146739058568557934581403627822703280
82616570773948327592232845941706525094512325230608
22918802058777319719839450180888072429661980811197
77158542502016545090413245809786882778948721859617
72107838435069186155435662884062257473692284509516
20849603980134001723930671666823555245252804609722
53503534226472524250874054075591789781264330331690"
	number = number.split.join
	numbers = []
	bucket = ""
	answer = 0
	number.each_char do |c|
		bucket << c
		if bucket.length == 50
			numbers << bucket
			bucket = ""
		end
	end

	100.times  {|i| answer += numbers[i].to_i}
	answer.to_s[0..9].to_i
end

p large_sum

#############
# Euler #14 #--------------------------------------------------------------
#############
def longest_collatz()
	max = 0
	number = 0
	for n in 2..1000000
		seq = []
		seq << n

		while n != 1
			if n.even?
				n = n/2
			elsif n.odd?
				n = 3*n + 1
			end
			seq << n
		end

		max, number = seq.length, seq[0] if n == 1 && seq.length > max
	end
	number
end

p longest_collatz

#############
# Euler #15 #--------------------------------------------------------------
#############
def pascals(depth)
    answer = [[1],[1,1]]
    bucket = []
    return [answer[0]] if depth == 0
    return answer if depth == 1

    while answer.length < depth + 1
        for i in 0..(answer[-1].length - 2)
            bucket << answer[-1][i] + answer[-1][i+1]
        end
        bucket.unshift(1)
        bucket.push(1)
        answer << bucket
        bucket = []
    end
    answer
end

def lattice_paths()
	size = 20
	size = size *2
	idx = pascals(size)[-1].length/2
	pascals(size)[-1][idx]

end
p lattice_paths

#############
# Euler #16 #--------------------------------------------------------------
#############
def power_digit_sum()
	number = 2**1000
	string = number.to_s
	sum = 0
	string.each_char {|c| sum += c.to_i}
	sum
end
p power_digit_sum

#############
# Euler #17 #--------------------------------------------------------------
#############
def number_letter_counts()
	numbers = (1..1000).to_a
	oneD = [3,3,5,4,4,3,5,5,4,3,6,6,8,8,7,7,9,8,8] #1-19
	twoD_tens = [3,6,6,5,5,5,7,6,6] #10,20,...90

	count = 0
	numbers.each do |n|
		#check for number divisible by 1000,100,10
		if n % 1000 == 0
			count += "onethousand".length
		elsif n % 100 == 0
			count += oneD[n.to_s[0].to_i - 1] + "hundred".length
		elsif n % 10 == 0
			if n < 100
				count += twoD_tens[n.to_s[0].to_i - 1]
			elsif n > 100
				count += oneD[n.to_s[0].to_i - 1] + "hundredand".length +
						twoD_tens[n.to_s[1].to_i - 1]
			end
		#check for rest of the numbers
		elsif n < 20
			count += oneD[n-1]
		elsif n < 100
			count += twoD_tens[n.to_s[0].to_i - 1] + oneD[n.to_s[1].to_i - 1]
		elsif n < 1000
			if (n.to_s[1..2].to_i) < 20
				count += oneD[n.to_s[0].to_i - 1] + "hundredand".length +
						oneD[n.to_s[1..2].to_i - 1]
			else
				count += oneD[n.to_s[0].to_i - 1] + "hundredand".length +
						twoD_tens[n.to_s[1].to_i - 1] + oneD[n.to_s[2].to_i - 1]
			end
		end
	end
	count
end

p number_letter_counts

#############
# Euler #18 #--------------------------------------------------------------
#############
def max_path()
	string =
	"75
	95 64
	17 47 82
	18 35 87 10
	20 04 82 47 65
	19 01 23 75 03 34
	88 02 77 73 07 63 67
	99 65 04 28 06 16 70 92
	41 41 26 56 83 40 80 70 33
	41 48 72 33 47 32 37 16 94 29
	53 71 44 65 25 43 91 52 97 51 14
	70 11 33 28 77 73 17 78 39 68 17 57
	91 71 52 38 17 14 91 43 58 50 27 29 48
	63 66 04 68 89 53 67 30 73 16 69 87 40 31
	04 62 98 27 23 09 70 98 73 93 38 53 60 04 23".split("\n")

	numbers = []
	string.each do |str|
		bucket = []
		str.split.each {|n| bucket << n.to_i}
		numbers << bucket
	end

	idx = numbers.length - 2

	while idx > -1
		numbers[idx].each_with_index do |number, i|
			number + numbers[idx+1][i] > number + numbers[idx+1][i+1] ? numbers[idx][i] = number + numbers[idx+1][i] : numbers[idx][i] = number + numbers[idx+1][i+1]
		end

		idx -= 1
	end
	numbers[0][0]

end

p max_path

#############
# Euler #19 #--------------------------------------------------------------
#############
# require 'byebug'
def counting_sundays()
	months = [31,28,31,30,31,30,31,31,30,31,30,31]
	leap_months = [31,29,31,30,31,30,31,31,30,31,30,31]
	day = 1			#1..7

	month = 1		#1..12
	month_day = 1	#1..28,29,30,31
	year = 1900		#1990..2000
	sundays = 0

	while year < 2001
		if year % 400 == 0
			current_months = leap_months
		elsif year % 4 == 0
			current_months = leap_months
		else
			current_months = months
		end

	# byebug

		if day == 1 && month_day == 1 && year > 1900
			sundays += 1
		end

		day += 1
		day = 1 if day > 7

		month_day += 1
		month_day = 1 if month_day > current_months[month - 1]

		month += 1 if month_day == 1
		if month > 12
			month = 1
			year += 1
		end
	end

	sundays
end

p counting_sundays

#############
# Euler #20 #--------------------------------------------------------------
#############
def factorial_digit_sum()
	given = 100

	number = (1..given).reduce {|mult, num| mult * num}
	number.to_s.each_char.reduce(0) {|sum, c| sum += c.to_i}

end

p factorial_digit_sum

#############
# Euler #21 #--------------------------------------------------------------
#############
def amicable_numbers()
	amicables = []

	for number in 2...10000
		divisors = []

		for divisor in 1...number
			divisors << divisor if number % divisor == 0
		end
		check_number = divisors.inject(:+)
		next if check_number > 9999

		check_divisors = []
		for divisor in 1...check_number
			check_divisors << divisor if check_number % divisor == 0
		end

		if check_divisors.inject(:+) == number && !amicables.include?(number) && number != check_number
			amicables << number
		end
	end

	amicables.inject(:+)
end

p amicable_numbers

#############
# Euler #22 #--------------------------------------------------------------
#############
def names_scores()
	file = File.open("/Users/Dan/Desktop/names.txt", "r").gets
	names = file.gsub('"', '').split(",").sort

	answer_array = []
	alphabets = ("A".."Z").to_a

	names.each_with_index do |name, idx|

		answer_array << name.each_char.inject(0) {|sum, c| sum + (alphabets.index(c) + 1)} * (idx + 1)
	end

	answer_array.inject(:+)
end

p names_scores

#############
# Euler #23 #--------------------------------------------------------------
#############

def abundant_num()
	abundant = []
	(2..28123).each do |number|
		divisors = []

		(1...number).each {|div| divisors << div if number % div == 0}			#takes ~30
		abundant << number if divisors.inject(:+) > number
	end
	abundant
end

def nonabundant_sum()
	abundant = abundant_num
	sum_two_abundant = []
	max = 28123
	all = (1..28123).to_a

	for i in 0..abundant.length - 1
		for j in 0..abundant.length - 1
			sum_two_abundant << abundant[i] + abundant[j] if abundant[i] + abundant[j] <= max
		end
	end

	(all - sum_two_abundant).inject(:+)

end

p nonabundant_sum

#############
# Euler #24 #--------------------------------------------------------------
#############
def lexicographic()
	digits = ('0'..'9').to_a
	digits.permutation.to_a[999999].join.to_i

  #using this way takes too long due to combination.
	# combinations = []

	# digits.each do |a|
	# 	digits.each do |b|
	# 		digits.each do |c|
	# 			digits.each do |d|
	# 				digits.each do |e|
	# 					digits.each do |f|
	# 						digits.each do |g|
	# 							digits.each do |h|
	# 								digits.each do |i|
	# 									digits.each do |j|
	# 										string = ""
	# 										string << a+b+c+d+e+f+g+h+i+j
	# 										combinations << string
	# 									end
	# 								end
	# 							end
	# 						end
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end
	# combinations.uniq.sort
	# combinations[999999].to_i

end

p lexicographic

#############
# Euler #25 #--------------------------------------------------------------
#############
def thousandth_fibonacci()
	fib = [1,1]

	while true
		if fib[-1].to_s.length == 1000
			return fib.length
		else
			fib << fib[-1] + fib[-2]
		end
	end
end

p thousandth_fibonacci()

#############
# Euler #26 #--------------------------------------------------------------
#############
"1/d has a cycle of n digits if (10^n) – 1 mod d = 0 for prime d for n being the smallest positive
integer satisfying the equation (10^n) - 1 mod d = 0"

def is_prime?(n)
	(2..Math.sqrt(n)).none? {|num| n % num == 0}
end

def reciprocal_cycles()
	d = 999
	d_n_array = []

	while d > 1
		if is_prime?(d)
			# n = 1

			for n in 1...d
				if ((10**n)-1) % d == 0
					d_n_array << [d, n]
					break
				end
			end

		end
		d -= 1

	end
	d_n_array.max_by {|denom, n_recur| n_recur}[0]
end

p reciprocal_cycles

#############
# Euler #27 #--------------------------------------------------------------
#############
def is_prime?(n)
	(2..Math.sqrt(n)).none? {|num| n % num == 0}
end

def quadratic_primes()
	max_n = 0
	ab = 0

	for a in -999..999
		for b in -1000..1000
			n = 0

			while n**2 + a*n + b > 0 && is_prime?(n**2 + a*n + b)
				n += 1
			end
			max_n, ab = n, a*b if n > max_n

		end
	end

	ab
end
p quadratic_primes

#############
# Euler #28 #--------------------------------------------------------------
#############
def spiral_diagonals()
	sum = 1
	step = 2
	current_num = 1					#1 to 3 to 5.. && 9 to 13 to 17...

	for spiral in 1..(1001/2)		#how many spirals to go around
		for round in 1..4 			#each spiral to tick all numbers in diagonal of certain nxn
			current_num += step
			sum += current_num
		end

		step += 2
	end

	sum
end
p spiral_diagonals

#############
# Euler #29 #--------------------------------------------------------------
#############
def distinct_powers()
	combinations = []

	for a in 2..100
		for b in 2..100
			combinations << a**b if !combinations.include?(a**b)
		end
	end

	combinations.sort.length
end
p distinct_powers

#############
# Euler #30 #--------------------------------------------------------------
#############
def digit_fifth_powers()
	max_num = 6*(9**5)
	chosen_numbers = []

	(2..max_num).each do |number|
		sum = 0

		number.to_s.each_char do |c|
			sum += c.to_i**5
		end

		chosen_numbers << sum if number == sum
	end

	chosen_numbers.inject(:+)
end
p digit_fifth_powers
