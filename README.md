# TrueRandom
Get true random numbers from [RANDOM.ORG](http://random.org).

# Description
Use the true random number service of [RANDOM.ORG](http://random.org). The randomness comes from atmospheric noise, which for many purposes is better than the pseudo-random number algorithms typically used in computer programs.


#Installation
##From the command line.

```shell
  gem install true-random
```

##Using Gemfile.

1 Add to your application Gemfile

```ruby
gem 'true-random'
```

2 Type

```shell
  bundle install
```

##Important note!
To access [RANDOM.ORG](http://random.org) via an automated client, please make sure you observe the [Guidelines for Automated Clients](http://www.random.org/clients/) or your computer may be banned.

#Usage
##Integer Generator
The Integer Generator will generate truly random integers in configurable intervals.

```ruby
  rnd = TrueRandom::Random.new
  puts rnd.integer
```

**Parameters**
*n*     The number of integers requested. 1 by default.
*min*   The smallest value allowed for each integer. 1 by default.
*max*   The largest value allowed for each integer. 100 by default.
*base*  The base that will be used to print the numbers, i.e., binary, octal, decimal or hexadecimal. Possible values are 2, 8, 10 or 16. 10 by default.

The same example with full parameters

```ruby
  rnd = TrueRandom::Random.new
  puts rnd.integer 1, 2, 100, 10
```

##Sequence Generator
The Sequence Generator will randomize a given interval of integers, i.e., arrange them in random order.

```ruby
  rnd = TrueRandom::Random.new
  puts rnd.sequence
```

**Parameters**
*min*   The lower bound of the interval (inclusive). 1 by default.
*max*   The upper bound of the interval (inclusive). 100 by default.

The sequence requested must 10,000 numbers or shorter in length, i.e., max-min+1=1e4.

##String Generator
The String Generator will generate truly random strings of various length and character compositions.

```ruby
  rnd = TrueRandom::Random.new
  puts rnd.string
```

**Parameters**
*n*           The number of strings requested. 1 by default.
*len*         The length of the strings. All the strings produced will have the same length. Max length 20. 20 by default.
*digits*      Determines whether digits (0-9) are allowed to occur in the strings. Possible values are true or false. True by default.
*upperalpha*  Determines whether uppercase alphabetic characters (A-Z) are allowed to occur in the strings. Possible values are true or false. True by default.
*loweralpha*  Determines lowercase alphabetic characters (a-z) are allowed to occur in the strings. Possible values are true or false. True by default.
*unique*      Determines whether the strings picked should be unique (as a series of raffle tickets drawn from a hat) or not (as a series of die rolls). If unique is set to on, then there is the additional constraint that the number of strings requested (num) must be less than or equal to the number of strings that exist with the selected length and characters. Possible values are true or false. True by default.

##Quota Checker
The Quota Checker allows you to examine your quota at any point in time. The quota system works on the basis of IP addresses. Each IP address has a base quota of 1,000,000 bits. When your client makes a request for random numbers (or strings, etc.), the server deducts the number of bits it took to satisfy your request from the quota associated with your client's IP address.

```ruby
  rnd = TrueRandom::Random.new
  puts rnd.quota
```

You can request for certain IP.

```ruby
  rnd = TrueRandom::Random.new
  puts rnd.quota 'n.n.n.n'
```

n.n.n.n is the IP address for which you wish to examine the quota. Each value for n should be an integer in the [0,255] interval. This parameter is optional. If you leave it out, it defaults to the IP address of the machine from which you are issuing the request.

##Using proxy server
To enable proxy feature, set a proxy host.

```ruby
  rnd = TrueRandom::Random.new
  rnd.proxy host, port
  puts rnd.integer
```

Set host to false to disable proxy.

Default port is 8080.

# License
Released under the MIT license: [http://www.opensource.org/licenses/MIT](http://www.opensource.org/licenses/MIT)
